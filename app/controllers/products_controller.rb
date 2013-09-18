class ProductsController < ApplicationController
	before_filter :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:like]
	def index
		unless params[:t]
			@products = Product.order("updated_at desc").paginate(page: params[:page], per_page: 4)
		else
			@products = Product.where("list_id = ? ", params[:t]).order("liked_count desc").paginate(page: params[:page], per_page: 4)
		end
			@products.each do |product|
				product.photos.build
			end
	end

	def show
		@product = Product.find(params[:id])
		@product.increment!(:view_count)
	end

	def like
		@user = current_user
		@products = @user.all_liked(Product).order("liked_count desc")
	end
	
	def liked
		@products = Product.order("liked_count desc").paginate(page: params[:page], per_page: 4)
	end	

	def search 
		begin
		@products = Product.where("title like ? or number like ?",
		'%'+params[:q]+'%','%'+params[:q]+'%').order("id desc").paginate(page: params[:page], per_page: 12)

			if @products.empty?
				redirect_to products_path, notice: t("products.no_match_products")
			else
				render 'index'
			end
		end
	end

	def new
		@product = Product.new
		@product.photos.build
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to products_path
		else
			render 'new'
		end
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to product_path
		else
			render 'edit'
	end
	end


	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

end

