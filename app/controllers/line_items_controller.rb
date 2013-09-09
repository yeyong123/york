class LineItemsController < ApplicationController

		def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		if @line_item.save
			redirect_to @line_item.cart
		end
	end


	def destroy
		@line_item = LineItem.find(params[:id])
		@line_item.destroy
		redirect_to line_items_url
	end

end

