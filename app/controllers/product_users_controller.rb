class ProductUsersController < ApplicationController
	before_filter :get_products

	def index
	end


	def visit
	end

	private

	def get_products
		@products = Product.order("view_count desc").paginate(page: params[:page],per_page: 4)
	end

end
