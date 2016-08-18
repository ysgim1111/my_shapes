function checkLoginState() {
  console.log('checkLoginState');
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);

  if (response.status === 'connected') {
    sendUserAccessInfo(response.authResponse);
  } else if (response.status === 'not_authorized') {
    alert('Please merge into this app.');
  } else {
    FB.login(function(response) {
      statusChangeCallback(response);
    }, {scope: 'public_profile,email'});
  }
}

function sendUserAccessInfo(response) {
  console.log('Welcome!  Fetching your information.... ');

  FB.api('/me?fields=id,name,email', function(userInfo) {
    if (userInfo.hasOwnProperty('email')) {
      $.ajax({
        url: '/facebook',
        method: 'post',
        data: userInfo
      }).done(function() {
        location.reload();
      });
    } else {
      alert('not permited email');
    }
  });
}

window.fbAsyncInit = function() {
  FB.init({
    appId      : '1751254675150181',
    cookie     : true,
    xfbml      : false,
    version    : 'v2.7'
  });
};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
