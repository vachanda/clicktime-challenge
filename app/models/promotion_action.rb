class PromotionAction < PromotionBase
	belongs_to :promotion

	has_many :adjustments
end