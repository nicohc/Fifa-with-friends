class MatchesController < ApplicationController
  def new
    @match = Match.new
    2.times do
      team = @match.teams.build
    end
  end

  def create
    @match = Match.new(match_params)
    if @match.teams.first.player_id != @match.teams.last.player_id
        if @match.save
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
