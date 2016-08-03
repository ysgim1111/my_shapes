$(document).on('click', '#savePostInfo', function() {
  $.ajax({
    url: '/purchases/save_post',
    method: 'post',
    data: {
      zonecode: $('#zonecode').val(),
      address: $('#address').val(),
      phone_number: $('#phone_number').val(),
      receiver: $('#receiver').val()
    }
  }).done(function() {
    alert('저장되었습니다');
  });
});