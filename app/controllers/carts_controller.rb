class CartsController < ApplicationController

	def index 
		@carts = Cart.all
	end

	def show
		begin
		@cart = Cart.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			logger.error "Attempt to access invalid cart #{params[:id]}"
			redirect_to products_path, notice: "invalid cart"
		else
			respond_to do |format|
				format.html
			end
		end
	end

	def new
		@cart = Cart.new
	end

	def edit
		@cart = Cart.find(params[:id])
	end

	def create
		@cart = Cart.new(params[:cart])
		if @cart.save
			rediect_to @cart
		else
			render 'new'
		end
	end

	def update
		@cart = Cart.find(params[:id])
		if @cart.update_attributes(params[:id])
			redirect_to @cart
		else
			render 'edit'
		end
	end

	def destroy
		@cart = current_cart
		@cart.destroy
		session[:cart_id] = nil
		redirect_to  products_path
	end
end
