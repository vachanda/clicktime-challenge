module Api
	module OrdersService
		class << self
			def create_line_item(params, item_params, order)
				line_item = LineItem.find_or_create_by(order: order, product: find_product(params))
				creation_params = item_params
				creation_params[:quantity] += line_item.quantity
				creation_params[:total] = creation_params[:quantity] * creation_params[:price]

				update_line_item(creation_params, line_item, order)
			end

			def update_line_item(params, line_item, order)
				line_item.update!(params)
				update_total(order)

				line_item
			end

			def remove_line_item(line_item)
				order = line_item.order
				line_item.destroy

				update_total(order)
			end

			private

			def find_product(params)
				Product.find(params[:line_item_attributes][:product_id])
			end

			def update_total(order)
				order.update_totals
				order.evaluate_system_promotions

				order.update_totals
			end
		end
	end
end