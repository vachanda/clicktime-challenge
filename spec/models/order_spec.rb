require 'spec_helper'

describe Order, type: :model do 
	describe "#update_totals" do
		it "recalculates the line_item totals."
		it "correct discount total is computed."
	end

	describe "#calculate_order_discount" do
		it "calculates only order discount using both line_item and order adjustments."
	end

	describe "#cart_details" do
		it "generates the line_item details for all the line_items."
		it "generates the correct structured data."
	end

	describe "#discount" do
		it "computes the correct order discount from only order adjustments."
	end

	describe "#line_item_discount" do
		it "computes the aggregated discount from all the line item adjustments."
	end

	describe "#total_items" do
		it "computes the total number of items in the order."
	end

	describe "#eligible_adjustments" do
		it "aggregates all the valid order adjustments."
	end

	describe "#all_eligible_adjustments" do
		it "aggregates all the line item and order valid adjustments."
	end

	describe "#recalulate_line_item_totals" do
		it "recomputes all the line items totals."
	end
end