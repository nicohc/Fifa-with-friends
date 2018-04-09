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
