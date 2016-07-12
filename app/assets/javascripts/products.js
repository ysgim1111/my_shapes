$(document).on('click', 'div.thumbnail > img', function() {
  if ($(this).data('href')) window.location.href = $(this).data('href');
});

$(document).on('click', '#addBasketBtn, #addWishlistBtn', function() {
  $.ajax({
    url: $(this).data('url'),
    method: 'post',
    data: {
      product_id: $(this).data('product-id')
    }
  }).done(function(response) {
    console.log(response);
  });
});