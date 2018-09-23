class SeasonsController < ApplicationController
  def new
  end

  def show
  end

  def all_seasons
    @seasons = Season.all
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    redirect_to all_seasons_path
  end


end
