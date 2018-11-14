require 'spec_helper'

describe Promotion::Actions::Item::FlatPercent, type: :model do
	describe "#applicable_items" do
		it "returns all the eligible line items for the action."
	end

	describe "#compute" do
		it "computes the adjustment amount for the line item."
		it "updates the adjustment amount of the line item if it exists."
	end

	describe "#create_item_adjustment" do
		it "creates the adjustment with the necessary attributes for the action."
	end
end