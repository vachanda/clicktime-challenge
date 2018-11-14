class Promotion
	module Rules
		class BulkCart < PromotionRule
			attr_accessor :total_items

			def applicable?(promotable)
				promotable.is_a?(Order)
			end

			def eligible?(order)
				if order.total_items < total_items.to_i
					promotion.errors.add(:base, "Promotion eligiblity minimum criteria is not met.")
				end

				!promotion.errors.present?
			end
		end
	end
end