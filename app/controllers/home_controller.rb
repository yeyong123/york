class HomeController < ApplicationController
	
	def index
			if params[:set_locale]
			redirect_to root_path(locale: params[:set_locale])
		else
			@products = Product.all
		end
	end
end
