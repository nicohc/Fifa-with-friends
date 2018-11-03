/* ==========================================
scrollTop() >= 300
Should be equal the the height of the header
========================================== */
function isMobileDevice() {
    return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
};

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


// When the user scrolls down 50px from the top of the document, resize the header's font size
/* window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementById("site_title").style.fontSize = "25px";
  } else {
    document.getElementById("site_title").style.fontSize = "80px";
  }
}
*/
