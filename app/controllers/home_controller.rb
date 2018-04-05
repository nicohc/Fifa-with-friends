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
    #reset_points()
    #reset_matches()
    #reset_players()
  end

  def all_matches
    @matches = Match.all
    @players = Player.all
  end

  def goal_count  

  end

end
