# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "yaml"

product_data = YAML.load_file(File.join(__dir__, "migrate/seeds/product_data.yaml"))

product_data.each do |product|
	Product.create!(product)
end

promotion_data = YAML.load_file(File.join(__dir__, "migrate/seeds/promotion_data.yaml"))

promotion_data.each do |promotion|
	Promotion.create!(promotion.deep_symbolize_keys)
end