$(document).on('click', 'img.data-href', function() {
  if ($(this).data('href')) window.location.href = $(this).data('href');
});
