class Order < ActiveRecord::Base
	include NumberGenerator
	include Order::Promotor
	include PromotionAdjustment

	has_many :line_items
	has_many :products, through: :line_items

	def update_totals
		recalulate_line_item_totals

		self.item_total = line_items.sum { |li| li.quantity * li.price }
		self.discount_total = calculate_order_discount
		self.total = self.item_total - self.discount_total

		self.save!
	end

	def calculate_order_discount
		all_eligible_adjustments.sum(&:amount)
	end

	def cart_details
		result = {
			line_items: []
		}.merge!(as_json(only: [:id, :number, :item_total, :discount_total, :total], 
			methods: [:total_items, :line_item_discount, :discount, :promotion_details]
		))

		line_items.each do |line_item|
			result[:line_items] << line_item.cart_details
		end

		result.deep_symbolize_keys
	end

	def discount
		eligible_adjustments.sum(&:amount)
	end

	def line_item_discount
		line_item_adjustments = line_items.map(&:eligible_adjustments).flatten

		line_item_adjustments.sum(&:amount)
	end

	def total_items
		line_items.sum(:quantity)
	end

	def eligible_adjustments
		Adjustment.valid.where(promotable_type: "Order", promotable_id: id)
	end

	def all_eligible_adjustments
		line_item_adjustments = line_items.map(&:eligible_adjustments)

		(line_item_adjustments + eligible_adjustments).compact.flatten
	end

	def recalulate_line_item_totals
		line_items.each do |li|
			li.update_total
		end
	end
end