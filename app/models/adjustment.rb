class Adjustment < ActiveRecord::Base
	belongs_to :promotion_action

	scope :valid, -> { where(eligible: true) }
end