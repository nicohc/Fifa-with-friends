class HomeController < ApplicationController
  def index
    @matches = Match.all
    @players = Player.all
  end
end
