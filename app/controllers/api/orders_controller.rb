module Api
	class OrdersController < Api::BaseController
		before_action :find_order

		def summary
			# To be implemented.
		end

		private

		def find_order
			@order = Order.find_by!(number: params[:number])
		end
	end
end