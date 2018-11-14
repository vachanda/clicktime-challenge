class Promotion < ActiveRecord::Base
	has_many :promotion_actions
	alias_method :actions, :promotion_actions

	has_many :promotion_rules
	alias_method :rules, :promotion_rules

	accepts_nested_attributes_for :promotion_actions, :promotion_rules

	scope :system_promotions, -> { where(default_apply: true) }

	def eligible?(promotable)
		return false if expired?

		applicable_rules = rules.select { |rule| rule.applicable?(promotable) }

		# Assumption: All of the promotion rules must be eligible for the promotion to be eligible.
		applicable_rules.all? do |rule|
			rule.eligible?(promotable)
		end
	end

	def expired?
		DateTime.now > expiry_date
	end
end