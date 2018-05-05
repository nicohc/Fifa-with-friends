$( document ).on('turbolinks:load', function() {
  $('.menu-symbol').on( 'click', function () {
        $('.mobile-menu').toggle();
  });
  $('.container').on( 'click', function () {
        $('.mobile-menu').hide();
  });
});
