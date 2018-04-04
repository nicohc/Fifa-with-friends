class HomeController < ApplicationController

  def index
    @matches = Match.all
    @players = Player.all
  end

  def reset_points
    @players = Player.all
    @players.each do |p|
      p.points = 0
      p.save
    end
  end
  
end
