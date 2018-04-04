class MatchesController < ApplicationController
  def new
    @match = Match.new
    2.times do
      team = @match.teams.build
    end
  end

  def create
    @match = Match.new(match_params)
    @playerone = Player.find(@match.teams.first.player_id)
    @playertwo = Player.find(@match.teams.last.player_id)

    if (@match.teams.first.player_id != @match.teams.last.player_id) || !((@match.teams.first.score = @match.teams.last.score) && @match.teams.first.prol_score.nil?)

        if @match.save
              if ((@match.teams.first.score > @match.teams.last.score) && !@match.prolongations)
                  flash[:notice] = "J1 a gagné"
                  @playerone.points += 3
                  @playerone.save
              elsif ((@match.teams.first.score < @match.teams.last.score) && !@match.prolongations)
                  flash[:notice] = "J2 a gagné"
                  @playertwo.points += 3
                  @playertwo.save

              elsif @match.prolongations && (@match.teams.first.score > @match.teams.last.score)
                  flash[:notice] = "J1 a gagné après prolongations"
                  @playerone.points += 2
                  @playerone.save
              elsif @match.prolongations && (@match.teams.first.score < @match.teams.last.score)
                  flash[:notice] = "J2 a gagné après prolongations"
                  @playertwo.points += 2
                  @playertwo.save

              elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score > @match.teams.last.prol_score)
                  flash[:notice] = "J1 a gagné aux tirs au buts."
                  @playerone.points += 1
                  @playerone.save
              elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score < @match.teams.last.prol_score)
                  flash[:notice] = "J2 a gagné aux tirs au buts."
                  @playertwo.points += 1
                  @playertwo.save
              else
                  p "Autre chose"
              end

          flash[:success] = "Votre match a bien été créé !"
          redirect_to @match
        else
          render 'new'
          p "Une erreur existe, veuillez recommencer."
        end
    else
      flash[:danger] = 'Indiquez deux joueurs différents !'
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @playerone = Player.find(@match.teams.first.player_id)
    @playertwo = Player.find(@match.teams.last.player_id)

    if ((@match.teams.first.score > @match.teams.last.score) && !@match.prolongations)
        @playerone.points -= 3
        p "Retrait points J1 a gagné"
        @playerone.save
    elsif ((@match.teams.first.score < @match.teams.last.score) && !@match.prolongations)
        @playertwo.points -= 3
        p "Retrait points J2 a gagné"
        @playertwo.save

    elsif @match.prolongations && (@match.teams.first.score > @match.teams.last.score)
        @playerone.points -= 2
        p "Retrait points : J1 a gagné après prolongations"
        @playerone.save
    elsif @match.prolongations && (@match.teams.first.score < @match.teams.last.score)
        @playertwo.points -= 2
        flash[:notice] = "Retrait points : J2 a gagné après prolongations"
        @playertwo.save

    elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score > @match.teams.last.prol_score)
        @playerone.points -= 1
        @playerone.save
        flash[:notice] = "Retrait points : J1 a gagné aux tirs au buts."
    elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score < @match.teams.last.prol_score)
        @playertwo.points -= 1
        flash[:notice] = "Retrait points : J2 a gagné aux tirs au buts."
        @playertwo.save
    else
        p "Autre chose"
    end

    if (@match.teams.first.player_id = @match.teams.last.player_id) || ((@match.teams.first.score = @match.teams.last.score) && @match.teams.first.prol_score.nil?)
          flash[:danger] = "Match non valide, veuillez vérifier les données indiquées !"
          render :action => 'edit'

    elsif @match.update(match_params)

      if ((@match.teams.first.score > @match.teams.last.score) && !@match.prolongations)
          @playerone.points =+ 3
          p "J1 a gagné"
          @playerone.save
      elsif ((@match.teams.first.score < @match.teams.last.score) && !@match.prolongations)
          @playertwo.points =+ 3
          p "J2 a gagné"
          @playertwo.save

      elsif @match.prolongations && (@match.teams.first.score > @match.teams.last.score)
          @playerone.points += 2
          p "J1 a gagné après prolongations"
          @playerone.save
      elsif @match.prolongations && (@match.teams.first.score < @match.teams.last.score)
          @playertwo.points += 2
          p "J2 a gagné après prolongations"
          @playertwo.save

      elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score > @match.teams.last.prol_score)
          @playerone.points += 1
          p "J1 a gagné aux tirs au buts."
          @playerone.save
      elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score < @match.teams.last.prol_score)
          @playertwo.points += 1
          p "J2 a gagné aux tirs au buts."
          @playertwo.save
      else
          p "Autre chose"
      end

      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def show
    @match = Match.find(params[:id])
    @home_team = Match.find(params[:id]).teams.first
    @visiting_team = Match.find(params[:id]).teams.last
    @playerone = Player.find(@match.teams.first.player_id)
    @playertwo = Player.find(@match.teams.last.player_id)
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to root_path
  end

  private
  def match_params
    params.require(:match).permit(:id, :prolongations,
      teams_attributes: [:id, :score, :prol_score, :name, :match_id, :player_id],
      )
  end
end
