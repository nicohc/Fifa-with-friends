class ClubsController < ApplicationController
  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
          flash[:success] = "Club créé !"
          redirect_to root_path
    else
      render :action => 'new'
      p "Une erreur existe, veuillez recommencer."
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
  end

  def show
    @club = Club.find(params[:id])
  end

  private
  def club_params
    params.require(:club).permit(:id, :name)
  end
end
