$(document).on('click', 'div.thumbnail > img', function() {
  if ($(this).data('href')) window.location.href = $(this).data('href');
});