class CustomersController < ApplicationController
	before_filter :authenticate_user!	
	before_filter :find_user

	def index
	end

	def show
		@customer = @user.customer
	end

	def edit
		@customer = @user.customer
	end

	def new
		@customer = @user.build_customer
		@customer.directories.build
	end

	def create
		@customer = @user.build_customer(params[:customer])
		if @customer.save
			redirect_to @customer
		else
			render 'new'
		end
	end

	def update
		@customer = @user.customer(params[:id])
		if @customer.update_attributes(params[:customer])
			redirect_to @customer
		else
			render 'edit'
		end
	end

	private

	def find_user
		@user = current_user
	end
end
