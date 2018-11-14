class PromotionRule < PromotionBase
	belongs_to :promotion

	def applicable?(_object)
		raise "applicable? should be called on the sub class of PromotionRule."
	end

	def eligible?(_object)
     	raise "eligible? should be called from the sub class of PromotionRule."
    end
end