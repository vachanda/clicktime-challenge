module Api
	class ProductsController < Api::BaseController
		def index
			products = Product.all

			render json: products
		end
	end
end