class ProductUsersController < ApplicationController

	def index
				@user = current_user
		@products = Product.order("view_count desc").paginate(page: params[:page],per_page: 4)
		end
end
