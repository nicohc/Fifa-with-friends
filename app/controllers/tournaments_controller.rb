class TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
    2.times do
      season = @tournament.seasons.build
    end
    @tournament.status = "opened"
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.finished = false
    @tournament.save
    if @tournament.format == "Coupe"
      @first_round = Round.create(:tournament_id => @tournament.id, :step => "Premier Tour")
      @first_round.save
      p @first_round
        i=1
        @tournament.seasons.each { |s|
          s.init_seat = i
          s.status = "alive"
          s.save
          p s
          r = Roundteam.create(:round_id => @first_round.id, :season_id => s.id)
          p r
          i += 1
        }
    end

    if @tournament.save
      redirect_to all_tournaments_path
    else
      render 'new'
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])

    @tournament_seasons = Season.where(["tournament_id = ?", @tournament.id]).pluck(:player_id)
    @tournament_players = Array.new
    @tournament_seasons.each{|ts|
      @tournament_players << Player.find(ts)
    }
    p @tournament_players
    @available_players = (Player.all - @tournament_players)
    p @available_players
  end

  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update(tournament_params)
      if @tournament.format == "Coupe" && @tournament.status = "opened"
          @first_round = @tournament.rounds.first
          i=1
          @tournament.seasons.each { |s|
            s.init_seat = i
            s.status = "alive"
            s.save
            p "Hello #{i}"
            p Roundteam.where(["round_id=? and season_id=?", @first_round, s.id])
          if Roundteam.where(["round_id=? and season_id=?", @first_round, s.id]).empty?
            r = Roundteam.create(:round_id => @first_round.id, :season_id => s.id)
            p "Hi #{r}"
          else
            p s.id
          end
          i += 1
        }
      end
      flash[:success] = "Votre compétition #{@tournament.name} a bien été mis à jour !"
      redirect_to all_tournaments_path
    else
      render :action => 'edit'
    end
  end

  def close_inscriptions
    @tournament = Tournament.find(params[:id])
    @tournament.status = "launched"
    c = @tournament.seasons.count
    a = [*1..c]
    p a
    @tournament.seasons.all.each{ |s|
      u = a.sample
      p u
      s.seat = u
      a.delete(u)
      p a
      s.save
    }
    @tournament.save
    redirect_to tournament_path(@tournament)
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

  def detach_season
    @tournament = Tournament.find(params[:id])
    season = Season.find(params[:season_id])
    @tournament.seasons.delete(season)
    redirect_to edit_tournament_path
  end


  def find_round
    eq_en_lice = @tournament.seasons.where(["status=?", "alive"]).count
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
    def maj_season_for_players
      if @player.seasons.empty?
      Player.all.each { |pl|
        pl.seasons.build
        pl.seasons.first.tournament_id = Tournament.last.id
        if pl.save
          flash[:success] = "Saison ajoutée !"
        else
          flash[:alert] = "Saison ajoutée !"
          render :action => 'edit'
        end
      }
      end
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
      params.require(:tournament).permit(:name, :format,
        :win_regular_points, :win_prol_points, :win_peno_points,
        :lose_regular_points, :lose_prol_points, :lose_peno_points,
        :draw_regular_points, seasons_attributes: [:id, :init_seat, :seat, :status, :player_id, :_destroy],
        rounds_attributes: [:id, :step],
        roundteams_attributes: [:id, :round_id, :season_id, :_destroy],
      )
  end


end
