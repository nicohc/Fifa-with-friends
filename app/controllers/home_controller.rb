class HomeController < ApplicationController
  def index
    @matches = Match.all
  end
end
