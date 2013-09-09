module SessionsHelper

	def find_cart(cart)
		cookies.permanent[:remember_token] = cart.remember_token
		self.current_cart = cart
	end

	def current_cart=(cart)
		@current_cart = cart
	end

	end

