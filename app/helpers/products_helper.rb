module ProductsHelper
	def product?
		@list = List.find_by_id(params[:id])
	end
end
