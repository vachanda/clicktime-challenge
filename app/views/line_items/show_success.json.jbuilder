json.set! :status, "success"

json.data do
	json.line_item do
		json.(@line_item, :id, :created_at, :updated_at, :quantity, :price, :discount_total, :total)
	end

	json.order do
		json.(@line_item.order, :id, :number)
	end
end