class CheckoutController < ApplicationController
	before_action :find_order

	def cart
		
	end

	private

	def find_order
		@order = Order.find_by_number(cookies[:orderNumber])
	end
end