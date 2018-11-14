$(document).ready(function() {
	$(".shopping-cart").hide();
});

$(document).click(function(e) {
    if (e.target.className != 'shopping-cart' && !$('.shopping-cart').find(e.target).length) {
        $(".shopping-cart").hide();
    }
});

function cartDropDown(event) {
	event.stopPropagation();
	$(".shopping-cart").fadeToggle("fast");
}