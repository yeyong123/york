class ProductsController < ApplicationController
	before_filter :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:index, :show]
	def index
		@products = Product.order("id desc").paginate(page: params[:page], per_page: 12)
		@products.each do |product|
			product.photos.build
		end
	end

	def show
		@product = Product.find(params[:id])
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

