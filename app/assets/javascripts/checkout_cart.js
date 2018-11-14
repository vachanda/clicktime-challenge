
/* Constructs LineItem Update payload */
function constructCartUpdatePayload(quantity, productId) {
  var payload = {
    "line_item_attributes": {},
    "order_attributes": {},
  }

  var orderNumber = fetchOrderExistingNumber();
  payload["order_attributes"]["number"] = orderNumber;
  payload["line_item_attributes"]["quantity"] = quantity;
  payload["line_item_attributes"]["product_id"] = productId;

  return payload;
}


/* Update quantity */
function updateQuantity(quantityInput)
{
  var newQuantity = $(quantityInput).val();
  var productRow = $(quantityInput).parent().parent();
  var lineItemId = productRow.children('.product-item-id').children('.line-item-id').val();
  var productId = productRow.children('.product-product-id').children('.product-id').val();
  var updateCartUrl = "/api/line_items/" + lineItemId;

  var payload = constructCartUpdatePayload(newQuantity, productId);

  $.ajax({
    url: updateCartUrl,
    type: 'PUT',
    data: payload,
  }).done(function() {
      console.log("Updated!");
      location.reload();
    }).fail(function(response) {
      alert("Failed to Update the item quantity! Please try later.");
  });
}


/* Remove item from cart */
function removeItem(removeButton)
{
  var productRow = $(removeButton).parent().parent();
  var lineItemId = productRow.children('.product-item-id').children('.line-item-id').val();
  var deleteLineItemUrl = "/api/line_items/" + lineItemId;

  $.ajax({
    url: deleteLineItemUrl,
    type: 'DELETE',
  }).done(function() {
      console.log("Deleted!");
      location.reload();
    }).fail(function(response) {
      alert("Failed to delete the item. Please try later.")
  });
}