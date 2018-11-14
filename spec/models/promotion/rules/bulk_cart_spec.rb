require 'spec_helper'

describe Promotion::Rules::BulkCart, type: :model do
	describe "#applicable?" do
		it "returns true if the promotable is applicable on the rule."
		it "returns false if the promotable is not applicable on the rule."
	end

	describe "#eligible?" do
		it "returns true if the promotable meets the eligibility criteria."
		it "returns false if the promotable does not meets the eligibility criteria."
	end
end