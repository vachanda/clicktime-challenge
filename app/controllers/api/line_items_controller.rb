module Api
	class LineItemsController < Api::BaseController
		before_action :find_order, only: [:create]
		before_action :create_order, if: :new_order?, only: [:create]
		before_action :find_product, only: [:create, :update]
		before_action :find_line_item, only: [:update, :destroy]

		rescue_from ActiveRecord::RecordNotFound do |exception| 
			send_response("line_items/show_error", { message: exception.message, code: :not_found}, :not_found) 
		end

		def create
			@line_item = Api::OrdersService.create_line_item(params ,line_item_params, @order)

			send_response("line_items/show_success", { line_item: @line_item }, :created)
		end

		def update
			@line_item = Api::OrdersService.update_line_item(line_item_params, @line_item, @line_item.order)

			send_response("line_items/show_success", { line_item: @line_item }, :ok)
		end

		def destroy
			Api::OrdersService.remove_line_item(@line_item)

			send_response("line_items/show_success", { line_item: @line_item }, :no_content)
		end

		private

		def find_line_item
			@line_item = LineItem.find(params[:id])
		end

		def line_item_params
			params.require(:line_item_attributes)

			params[:line_item_attributes].permit(:quantity, :price)
			{
				quantity: params[:line_item_attributes][:quantity].to_i,
				price: @product.price,
				total: params[:line_item_attributes][:quantity].to_i * @product.price
			}
		end

		def find_product
			@product = Product.find(params[:line_item_attributes][:product_id])
		end

		def new_order?
			@order.nil?
		end

		def create_order
			@order = Order.create!
		end

		def find_order
			@order = Order.find_by(number: params[:order_attributes][:number]) if params[:order_attributes].present?
		end
	end
end