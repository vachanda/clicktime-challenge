class Promotion
	module Actions
		module Item
			class FlatPercent < PromotionAction
				attr_accessor :rate

				def applicable_items(order)
					promotion.rules.map { |rule| rule.eligible_items(order) }.compact.flatten
				end

				def compute(order)
					items = applicable_items(order)

					items.each do |item|
						existing_adjustment = adjustments.valid.find_by(promotable_id: item.id, promotable_type: "LineItem")

						discount_amount = item.price * item.quantity * rate.to_f / 100.00

						if existing_adjustment.present?
							existing_adjustment.amount = discount_amount
							existing_adjustment.save!
						else
							create_item_adjustment(item, discount_amount)
						end
					end
				end

				private

				def create_item_adjustment(item, amount)
					adjustment = self.adjustments.build

					adjustment.update!(
						promotable_id: item.id,
						promotable_type: item.class.to_s,
						eligible: true,
						amount: amount
					)
				end
			end
		end
	end
end