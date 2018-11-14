require 'spec_helper'

describe Order::Promotor, type: :module do
	describe "#evaluate_system_promotions" do
		it "aggregates all the applicable system promotions."
		it "updates adjustment eligibility based on promotion eligibility."
	end

	describe "#create_adjustments" do
		it "creates adjustments for each action of the promotion."
	end

	describe "#mark_as_ineligible" do
		it "aggregates over all the valid adjustments."
		it "updates the valid adjustments of the actions as ineligible."
	end
end