class TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.finished = false
    if @tournament.save
      redirect_to all_tournaments_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def close_tournament
    @tournament = Tournament.find(params[:id])
    @tournament.finished = true
    @tournament.save
    redirect_to tournament_path(@tournament)
  end
  def open_tournament
    @tournament = Tournament.find(params[:id])
    @tournament.finished = false
    @tournament.save
    redirect_to tournament_path(@tournament)
  end

  def all_tournaments
    @tournaments = Tournament.all
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to all_tournaments_path
  end


  private
  def tournament_params
      params.require(:tournament).permit(:name,
        :win_regular_points, :win_prol_points, :win_peno_points,
        :lose_regular_points, :lose_prol_points, :lose_peno_points,
        :draw_regular_points
      )
  end


end
