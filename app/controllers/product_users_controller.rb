class ProductUsersController < ApplicationController

	def index
		@products = Product.order("view_count desc").paginate(page: params[:page],per_page: 4)
	end



end
