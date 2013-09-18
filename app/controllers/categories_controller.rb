class CategoriesController < ApplicationController

	def index
		@categories = Category.order("id desc").paginate(page: params[:page], per_page: 2)
	end

	def show
		@category = Category.find(params[:id])
	end

	def tags
		@lists = List.where("tag_id = ?", params[:t])
	end

	def new
		@category = Category.new
		@tag = @category.tags.build
		@tag.lists.build
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
				redirect_to categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end
end
