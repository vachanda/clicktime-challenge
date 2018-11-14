class Order
	module Promotor
		def evaluate_system_promotions
			Promotion.system_promotions.order(priority: :desc).each do |promotion|
				if promotion.eligible?(self)
					create_adjustments(promotion)
				else
					mark_as_ineligible(promotion)
				end
			end
		end

		def create_adjustments(promotion)
			promotion.actions.each do |action|
				action.compute(self)
			end
		end

		def mark_as_ineligible(promotion)
			promotion.actions.each do |action|
				next if action.adjustments.valid.empty?

				action.adjustments.valid.update_all(eligible: false)
			end
		end
	end
end