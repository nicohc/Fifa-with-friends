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

    if @match.teams.first.player_id != @match.teams.last.player_id
        if @match.save


              if (@match.teams.first.score > @match.teams.last.score) && (@match.prolongations = false)
                  @playerone.points += 3
                  p "J1 a gagné"
              elsif @match.prolongations && (@match.teams.first.score > @match.teams.last.score)
                  @playerone.points += 2
                  p "J1 a gagné après prolongations"
              elsif @match.prolongations && (@match.teams.first.score = @match.teams.last.score) && (@match.teams.first.prol_score > @match.teams.last.prol_score)
                  @playerone.points += 1
                  p "J1 est allé jusqu'aux tirs au buts."
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
    if @match.update(match_params)
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
