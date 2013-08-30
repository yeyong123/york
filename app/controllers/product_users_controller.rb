class ProductUsersController < ApplicationController

	def index
		@products = Product.order("view_count desc").paginate(page: params[:page],per_page: 4)
	end

	def show
		@user = current_user
	end

	def new 
		@product_users = ProductUser.new
	end


	def create
		@user = current_user
		product = Product.find(params[:product_id])
		@product_user = @user.like_product(product.id)
		if @product_user.save
			redirect_to @product_users.user
		else
			render 'new'
		end
	end
end
