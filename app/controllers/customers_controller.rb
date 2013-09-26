class CustomersController < ApplicationController
	before_filter :authenticate_user!	

	def index
	end

	def show
		@user = current_user
	end

	def new
		user = current_user
		@customer = user.build_customer
		@customer.directories.build
	end

	def create
		@user = current_user
		@customer = @user.build_customer(params[:customer])
		if @customer.save
			redirect_to @customer
		else
			render 'new'
		end
	end
end
