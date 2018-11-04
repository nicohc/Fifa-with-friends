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


$(document).ready(function(){

  $("#match_tournament_id").on('change', function(){
      alert("The tournament id is: " + $(this).val() );
      // The value (the id of the team) does update on selection option change.
      // Now I need to specify that I want the select options for the staff members
      // select box to update and show only staff members with this team_id
      console.log("hello " + $(this).val());
      $.ajax({
        url: '/matches/populate_other_list',
        type: "GET",
        data: {tournament_id: $(this).val()},
        // Callbacks that will be explained
        // Ajax call
        success: function(data) {
          $("#match_teams_attributes_0_player_id").empty();
          $("#match_teams_attributes_0_player_id").append('<option value="' + selected_players[i]["id"] + '">' + selected_players[i]["pseudo"] + '</option>');
          // Create options and append to the list
          console.log("helloo" + data);

        }
        // Rest of Ajax call
      });
  });

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
