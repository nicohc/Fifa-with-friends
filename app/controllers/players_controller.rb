class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(players_params)
    @player.points = 0
    if @player.save
      redirect_to @player
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @player = Player.find(params[:id])
    @teams = Team.all
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to root_path
  end

  private
  def players_params
      params.require(:player).permit(:pseudo, :points)
  end


end
