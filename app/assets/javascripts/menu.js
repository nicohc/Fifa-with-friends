
$(window).scroll(function(){
  if ( window.location.pathname == '/' ){
    if ($(window).scrollTop() >= 110) {
        $('nav').addClass('sticky');
        $('nav').addClass('navbar-fixed');

        if ( isMobileDevice() == false){
          $('.container .main_content').addClass('container-wfixednav');
        }
    }
    else {
        $('nav').removeClass('sticky');
        $('nav').removeClass('navbar-fixed');
        if ( isMobileDevice() == false){
          $('.container .main_content').removeClass('container-wfixednav');
        }
    };
  }
  else {
    $('nav').addClass('sticky');
    $('nav').addClass('navbar-fixed');
    if ( isMobileDevice() == false){
      $('.container .main_content').addClass('container-wfixednav');
    }
  };
});
