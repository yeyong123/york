module CurrentCart
	extend ActiveSupport::Concern

	private

	def set_cart
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart_id
	end
end

