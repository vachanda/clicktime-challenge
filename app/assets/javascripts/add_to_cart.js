function handleAddToCart(element) {
	var productId = element.getAttribute("value");
	var addToCartUrl = "/api/line_items"
	var payload = constructAddtoCartPayload(productId);

	$.post(addToCartUrl, payload).done(
		function(response) {
			// alert("Yaay! Successfully added to cart.");
			var orderNumber = response.data.order.number;
			/* Set the orderNumber Cookie. */
			document.cookie =  "orderNumber=" + orderNumber;
			location.reload();
		}).fail(function(response) {
			alert("Failed to Add the product to cart. Error: " + response.responseText);
		});
}

function constructAddtoCartPayload(productId) {
	var data = {
		"line_item_attributes": {},
		"order_attributes": {},
	};

	var orderNumber = fetchOrderExistingNumber();

	data["order_attributes"]["number"] = orderNumber;
	data["line_item_attributes"]["product_id"] = productId;
	data["line_item_attributes"]["quantity"] = 1;

	return data;
}

function fetchOrderExistingNumber() {
	var key = "orderNumber";
	var cookies = "; " + document.cookie;
	var pairs = cookies.split("; " + key + "=");

	if (pairs.length == 2) return pairs.pop().split(";").shift();
}