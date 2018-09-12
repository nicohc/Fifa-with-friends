/* ==========================================
scrollTop() >= 300
Should be equal the the height of the header
========================================== */

$(window).scroll(function(){
    if ($(window).scrollTop() >= 110) {
        $('nav').addClass('sticky');
        $('nav').addClass('navbar-fixed');
    }
    else {
        $('nav').removeClass('sticky');
        $('nav').removeClass('navbar-fixed');
    }
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
