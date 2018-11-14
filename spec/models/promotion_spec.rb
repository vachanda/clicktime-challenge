require 'spec_helper'

describe Promotion, type: :model do
	describe "#eligible?" do
		it "checks and collects the rules which are applicable."
		it "checks the eligibility of all the applicable rules."
		it "returns true if all the applicable rules are eligible."
		it "return false one of the applicable rule is not eligible."
	end

	describe "#expired?" do
		it "returns true if the promotion is expired."
		it "returns false if the promotion is not expired."
	end
end