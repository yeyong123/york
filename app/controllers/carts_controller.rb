class CartsController < ApplicationController

	def show
		@cart = find_cart
	end


end
