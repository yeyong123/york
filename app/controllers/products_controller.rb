class ProductsController < ApplicationController

	def index
		@products = Product.order("id desc").paginate(page: params[:page], per_page: 12)

	end

	def show
		@product = Product.find(params[id])
	end

	def new
		@product = Product.new
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
		if @product.update(params[:product])
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

