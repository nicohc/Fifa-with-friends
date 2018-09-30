class TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
    2.times do
      season = @tournament.seasons.build
    end
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
    @tournament = Tournament.find(params[:id])
    season = @tournament.seasons.build
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      flash[:success] = "Votre tournament a bien été mis à jour !"
      redirect_to all_tournaments_path
    else
      render :action => 'edit'
    end
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

=begin
    def maj_tournament_for_matches
      Match.all.each { |m|
        m.tournament_id = Tournament.last.id
        m.save
      }
      redirect_to all_matches_path
    end
    def migrate_all_existing_matches_to_last_season
      Team.all.each { |t|
          t.season_id = t.player.seasons.last.id
          t.save
      }
      redirect_to all_tournaments_path
    end
    def migrate_all_player_stats_to_last_season_stats
      Season.all.each { |se|
          se.points = se.player.points
          se.win = se.player.win
          se.win_prol = se.player.win_prol
          se.win_peno = se.player.win_peno
          se.lose = se.player.lose
          se.lose_prol = se.player.lose_prol
          se.lose_peno = se.player.lose_peno
          se.save
      }
      redirect_to all_tournaments_path
    end
=end

  private
  def tournament_params
      params.require(:tournament).permit(:name,
        :win_regular_points, :win_prol_points, :win_peno_points,
        :lose_regular_points, :lose_prol_points, :lose_peno_points,
        :draw_regular_points,
        seasons_attributes: [:id, :player_id],
      )
  end


end
