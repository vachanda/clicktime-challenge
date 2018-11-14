require 'spec_helper'

describe Promotion::Actions::Order::FlatPercent, type: :model do
	describe "#compute" do
		it "computes the discount amount for the particular order."
		it "updates the existing adjustment with the amount."
		it "creates a new adjustment with the discount amount."
	end

	describe "#create_item_adjustment" do
		it "creates the adjustment with the necessary attributes for the action."
	end
end