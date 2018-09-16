class TournamentsController < ApplicationController
  def new
  end

  def edit
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def all_tournaments
    @tournaments = Tournament.all
  end
end
