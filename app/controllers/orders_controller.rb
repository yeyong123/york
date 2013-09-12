class OrdersController < ApplicationController

	def index
		@orders = Order.order('created_at desc').paginate(page: params[:page], per_page: 12)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@cart = find_cart
		if @cart.line_items.empty?
			redirect_to products_path, notice: "你没有添加商品"
			return
		end
		@order = Order.new
	end

	def edit
		@order = Order.find(params[:id])
	end

	def create
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(find_cart)
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			#Notifier.order_received(@order).deliver
			redirect_to products_path, notice: "订单已经发送"
		else
			render 'new'
		end
	end

	def update 
		@order = Order.find(params[:id])
		if @order.update_attributes(params[:order])
			redirect_to products_path, notice: "订单已经更新"
		else
			render 'edit'
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to :back
	end

end
