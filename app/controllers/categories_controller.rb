class CategoriesController < ApplicationController

	def index
	end

	def show
		@category = Category.find(params[:id])
	end

	def tags
		@lists = List.where("tag_id = ?", params[:t])
	end

end
