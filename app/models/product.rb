class Product < ActiveRecord::Base
	def cart_details
		as_json(only: [:name, :description, :id], methods: [:image_url])
	end	

	def image_url(style = "cart")
		"/assets/#{style}/#{name.underscore.gsub(' ', '_')}.jpg"
	end
end