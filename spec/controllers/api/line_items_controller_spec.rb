require 'spec_helper'

describe Api::LineItemsController, type: :controller do
	describe "POST create" do
		it "creates new line items based on the sent params."
		it "creates new order if the order attributes are missing."
		it "updates the line items params of the line item exists."
		it "renders the valid json response on success with status 201."
		it "renders the valid json response on error with status 404."
	end

	describe "PUT update" do
		it "updates the quantities of the line items."
		it "returns 404 response if the line item is not found."
		it "renders the valid json response on success with status 200."
		it "renders the valid json response on error with status 404."
	end

	describe "DELETE destory" do
		it "deletes the line item."
		it "returns 404 response if the line item is not found."
		it "renders the empty response on success with status 204."
		it "renders the valid json response on error with status 404."
	end
end