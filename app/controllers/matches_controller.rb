class MatchesController < ApplicationController
  def new
    @match = Match.new
    @match.build_home_team
    @match.build_visiting_team
  end

  def create
    @match = Match.new(match_params)
    @match.home_team.save
    @match.visiting_team.save

      if @match.save
        flash[:success] = "Votre match a bien été créé !"
        redirect_to @match
      else
        render 'new'
        p "Une erreur existe, veuillez recommencer."
      end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def show
    @match = Match.find(params[:id])
#    @home_team = Team.where(match_id = params[:id]).first
#    @visiting_team = Team.where(match_id = params[:id]).last
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to root_path
  end

  private
  def match_params
    params.require(:match).permit(:id, :prolongations,
      home_team_attributes: [:id, :score, :name, :match_id],
      visiting_team_attributes: [:id, :score, :name, :match_id])
  end
end
