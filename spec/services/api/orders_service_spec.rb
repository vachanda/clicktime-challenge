require 'spec_helper'

describe Api::OrdersService, type: :service do 
	describe "#create_line_item" do
		it "computes the total price based on the quantity for the line item."
		it "creates the line item based on the passed params."
	end

	describe "#update_line_item" do
		it "updates the permitted attributes of the line item."
		it "calls the #update_total funcation after line item update."
	end

	describe "#remove_line_item" do
		it "deletes the requried line item."
		it "calls the #update_total funcation after line item update."
	end

	describe "#update_total" do
		it "propagates the line item and order totals."
		it "creates/removes adjustments based on the update."
	end
end