class LineItem < ActiveRecord::Base
	include PromotionAdjustment
	belongs_to :product
	belongs_to :order

	def update_total
		self.discount_total = computed_discount
		self.total = (self.price * self.quantity) - self.discount_total

		self.save!
	end

	def cart_details
		as_json(
			only: [:id, :price, :total, :quantity, :discount_total], 
			methods: [:promotion_details]
		).merge(product: product.cart_details)
	end

	def eligible_adjustments
		Adjustment.valid.where(promotable_type: "LineItem", promotable_id: id)
	end

	def computed_discount
		eligible_adjustments.sum(:amount)
	end
end