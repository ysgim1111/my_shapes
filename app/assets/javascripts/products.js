$(document).on('click', 'div.thumbnail > img', function() {
  console.log($(this));
  window.location.href = $(this).data('href');
});