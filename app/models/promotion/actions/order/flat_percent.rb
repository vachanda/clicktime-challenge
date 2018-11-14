class Promotion
	module Actions
		module Order
			class FlatPercent < PromotionAction
				attr_accessor :rate

				def compute(order)
					existing_adjustment = adjustments.valid.find_by(promotable_type: "Order", promotable_id: order.id)

					discount_amount = (order.item_total - order.line_item_discount) * rate.to_f / 100.00

					if existing_adjustment.present?
						existing_adjustment.amount = discount_amount
						existing_adjustment.save!					
					else
						create_order_adjustment(order, discount_amount)
					end
				end

				private

				def create_order_adjustment(order, amount)
					adjustment = self.adjustments.build

					adjustment.update!(
						promotable_id: order.id,
						promotable_type: order.class.to_s,
						eligible: true,
						amount: amount
					)
				end
			end
		end
	end
end