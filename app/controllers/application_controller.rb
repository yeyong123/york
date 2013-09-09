class ApplicationController < ActionController::Base
	before_filter :set_i18n_locale_from_params
  protect_from_forgery
	before_filter :find_cart

	protected

	def set_i18n_locale_from_params
		if params[:locale]
			if I18n.available_locales.include?(params[:locale].to_sym)
				I18n.locale = params[:locale]
			else
				flash.now[:notice] = "#{params[:locale]} 翻译不可用."
				logger.error flash.now[:notice]
			end
		end
	end

	def default_url_options
		{locale: I18n.locale}
	end

	private

	def current_cart
		if user_signed_in? && current_user
			if current_user.cart.nil?
				@cart = current_user.create_cart
			else
				@cart = Cart.find_by_user_id(session[:user_id])
			end
		else
			Cart.find(session[:cart_id])
		end
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
		@cart
	end

	def find_cart
		if user_signed_in? && current_user
			@cart = current_user.cart
		else
			@cart = current_cart
		end
	end
end

