require 'spec_helper'

describe LineItem, type: :model do
	describe "#update_total" do
		it "recomputes the line item's total using the valid adjustments."
	end

	describe "#cart_details" do
		it "generates a valid hash including the product attributes."
		it "generates a valid hash with all the necessary line item attributes."
	end

	describe "#eligible_adjustments" do
		it "aggregates all the valid adjustments of the line item."
	end

	describe "#computed_discount" do
		it "computes the line item discount with the valid adjustments."
	end
end