module PromotionAdjustment
	extend ActiveSupport::Concern 

	def promotion_details
		promotion_data = []
		eligible_adjustments.each do |adj|
			promo = adj.promotion_action.promotion
			promotion_data << promo.as_json(only: [:name])
		end

		promotion_data
	end
end