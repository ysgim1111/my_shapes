$(window).load(function(){
  initNeon();
  initNavbar();
  initScroller();
});

function initNeon(){
  $('#close_neon').on('click',function(){
          if( $('nav').hasClass('neon') ){
            $('#front_neon').fadeOut('slow');
            $(this).fadeOut('slow');
            $('nav').removeClass('neon');
          }
  })
}
/* --------------------------------------------------
Navigation | Navbar
-------------------------------------------------- */

function initNavbar(){

  // Sticky Nav & Transparent Background
  $(window).scroll(function(){

    if ($(window).scrollTop() > 20) {
      $('nav').removeClass('navbar-trans', 300);
      $('nav').removeClass('navbar-trans-dark');
      $('nav').addClass('navbar-small', 300);
    }
    else {
      $('nav:not(.mobile-nav)').addClass('navbar-trans', 300);
      $('nav').removeClass('navbar-small', 300);

      if ($('nav').hasClass('trans-helper')) {
        $('nav:not(.mobile-nav)').addClass('navbar-trans-dark');
      }
    }

    $('nav:not(.navbar-fixed-top)').removeClass('navbar-trans navbar-small navbar-trans-dark');

  });


  // Nav on mobile screens
  $(window).resize(function() {
        if ($(window).width() <= 1259) {
      $('nav').addClass('mobile-nav');
      } else {
        $('nav').removeClass('mobile-nav');
      }

      if ($('nav').hasClass('mobile-nav')) {
        $('nav').removeClass('navbar-trans');
        $('nav').removeClass('navbar-trans-dark');
      } else {
        if ($(window).width() >= 1259 && $(window).top) {
          $('nav').addClass('navbar-trans');
        }
      }

      // Remove dropdown open on hover for small screens
      if ($('nav').hasClass('mobile-nav')) {

        $('.dropdown-toggle').on('mouseover', function(e){
                e.preventDefault();

                $('.dropdown').removeClass('open');

            e.stopPropagation();
        });
      }

      // Close mobile menu when clicked link
      // var isNotDropdown = $('nav:not(.mobile-nav)');

      if (!$('.nav a').hasClass('dropdown-toggle')) {

        $('.nav a').on('click', function(){
            if($('.navbar-toggle').css('display') !='none'){
                $(".navbar-toggle").trigger( "click" );
            }
        });

      }

    }).resize();

} // initNavbar



/* --------------------------------------------------
Scroll Nav
-------------------------------------------------- */

function initScroller () {

  $('#navbar').localScroll({
    easing: 'easeInOutExpo'
  });

  $('#page-top').localScroll({
    easing: 'easeInOutExpo'
  });
} // initScroller
