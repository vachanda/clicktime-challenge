class Promotion
	module Rules
		class ProductCategory < PromotionRule
			attr_accessor :category

			def applicable?(promotable)
				promotable.is_a?(Order)
			end

			def eligible?(order)
				required_product_ids = Product.where(category: category).pluck(:id)

				if (required_product_ids - order.line_items.pluck(:product_id)).present?
					promotion.errors.add(:base, "Promotion eligiblity minimum criteria is not met.")
				end

				!promotion.errors.present?
			end

			def eligible_items(order)
				required_product_ids = Product.where(category: category).pluck(:id)

				order.line_items.where(product_id: required_product_ids)				
			end
		end
	end
end