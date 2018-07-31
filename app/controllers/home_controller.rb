class HomeController < ApplicationController

  def reset_points
    @players = Player.all
    @players.each do |p|
      p.points = 0
      p.save
    end
  end

  def reset_matches
    Match.all.destroy_all
  end

  def reset_players
    Player.all.destroy_all
  end

  def index
    @matches = Match.all
    @match_une = Match.last

    maj_status_last_match()

    image_a_la_une()
    @players = Player.all
    @comments = Comment.all
    #reset_points()
    #reset_matches()
    #reset_players()
  end


  def all_matches
    @matches = Match.all
    @players = Player.all
  end

  def leaderboard
    @matches = Match.all
    @players = Player.all
  end

  def maj_status_last_match
    if Match.last.nil?
      p "Pas de last match"
    else
      if Match.last.teams.first.status.nil?
          if ((@match_une.teams.first.score > @match_une.teams.last.score) && !@match_une.prolongations)
              flash[:notice] = "J1 a gagné"
              @match_une.teams.first.update_columns(status: "winner")
              @match_une.teams.last.update_columns(status: "loser")
          elsif ((@match_une.teams.first.score < @match_une.teams.last.score) && !@match_une.prolongations)
              flash[:notice] = "J2 a gagné"
              @match_une.teams.first.update_columns(status: "loser")
              @match_une.teams.last.update_columns(status: "winner")

          elsif @match_une.prolongations && (@match_une.teams.first.score > @match_une.teams.last.score)
              flash[:notice] = "J1 a gagné après prolongations"
              @match_une.teams.first.update_columns(status: "winner")
              @match_une.teams.last.update_columns(status: "loser")
          elsif @match_une.prolongations && (@match_une.teams.first.score < @match_une.teams.last.score)
              flash[:notice] = "J2 a gagné après prolongations"
              @match_une.teams.first.update_columns(status: "loser")
              @match_une.teams.last.update_columns(status: "winner")
          elsif (@match_une.teams.first.score == @match_une.teams.last.score) && (@match_une.teams.first.prol_score > @match_une.teams.last.prol_score)
              flash[:notice] = "J1 a gagné aux tirs au buts."
              @match_une.prolongations = true
              @match_une.teams.first.update_columns(status: "winner")
              @match_une.teams.last.update_columns(status: "loser")
              @match_une.save
          elsif (@match_une.teams.first.score == @match_une.teams.last.score) && (@match_une.teams.first.prol_score < @match_une.teams.last.prol_score)
              flash[:notice] = "J2 a gagné aux tirs au buts."
              @match_une.prolongations = true
              @match_une.teams.first.update_columns(status: "loser")
              @match_une.teams.last.update_columns(status: "winner")
              @match_une.save
          end
      end
    end
  end



  def image_a_la_une
    if !@matches.first.nil?
      if @match_une.teams.where("status='winner'").first.club.image_url.nil?
        @image_a_la_une = 'clubs/noclub.jpg'
      else
        @image_a_la_une = @match_une.teams.where("status = 'winner'").first.club.image_url
      end
    end
  end



=begin

  def goal_count
    @player.goals = Team.all.where("player_id='#{@player.id}'").sum(:score)
  end

  def pourcent_games(value)
    new_value = (value /= player.teams.count)
    new_value *= 100
  end

=end

end
