$(document).on('click', 'img.link-thumb', function() {
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

$(document).ready(function(){
  var standard_width = parseInt($('.main_center_image').width())/2 - parseInt($('.main_service').width())/2 - 20;
  $('.main_service').css('left',standard_width);
});