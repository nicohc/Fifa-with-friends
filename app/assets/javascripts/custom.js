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



// MIse à jour auto des noms des joueurs disponibles lors d'un MAtch NEW
$(document).on("change", "#match_tournament_id", function(){
    // alert("Le tournoi sélectionné est id: " + $(this).val() );
    // The value (the id of the team) does update on selection option change.
    // Now I need to specify that I want the select options for the staff members
    // select box to update and show only staff members with this team_id
    console.log("Selection du Tournoi " + $(this).val());
    $.ajax({
      url: '/matches/new',
      type: "GET",
      dataType: "json",
      data: {tournament_id: $(this).val()},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      // Callbacks that will be explained
      // Ajax call
      success: function (response) {
        $("#match_teams_attributes_0_player_id").empty();
        $("#match_teams_attributes_1_player_id").empty();

        var players = response["selected_players"];
        $("#match_teams_attributes_0_player_id").append('<option>Choisir un joueur</option>');
        $("#match_teams_attributes_1_player_id").append('<option>Choisir un joueur</option>');
        for(var i=0; i< players.length; i++){
          $("#match_teams_attributes_0_player_id").append('<option value="' + players[i]["id"] + '">' + players[i]["pseudo"] + '</option>');
          $("#match_teams_attributes_1_player_id").append('<option value="' + players[i]["id"] + '">' + players[i]["pseudo"] + '</option>');
        }

      }
      /**********************************************/
      //Evaluate and make sure value is string
      //debugger;
      //console.log(response);
      /*************************************************/
      // Rest of Ajax call
    });
});

$(document).on("change", "#match_teams_attributes_0_club_id", function(){

  console.log("Club selectionné " + $(this).val());
  $.ajax({
    url: '/matches/new',
    type: "GET",
    dataType: "json",
    data: {club_id: $(this).val()},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    // Callbacks that will be explained
    // Ajax call
    success: function (response) {
      var club = response["selected_club"];
      $(".new_match_team_bloc_club_star").empty();
      $(".new_match_team_bloc_club_star").append(club[0]["level"]);

    }

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
