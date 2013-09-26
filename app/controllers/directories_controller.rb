class DirectoriesController < ApplicationController

	def index
		@directories = Directory.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@directory = Directory.new
	end

	def create
		@directory = Directory.new(params[:directory])
		if @directory.save
			redirect_to :back, notice: "感谢你花时间申请，我们会尽快给你邮寄样册"
		else
			render 'new'
		end
	end
end
