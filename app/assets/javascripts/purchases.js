$(document).on('click', '#savePostInfo', function() {
  $.ajax({
    url: '/purchases/save_post',
    method: 'post',
    data: {
      zonecode: $('#zonecode').val(),
      address: $('#address').val(),
      address_detail: $('#address_detail').val(),
      phone_number: $('#phone_number1').val() + '-' + $('#phone_number2').val() + '-' + $('#phone_number3').val(),
      name: $('#address_book_name').val(),
      receiver: $('#receiver').val()
    }
  }).done(function() {
    alert('저장되었습니다');
  });
});