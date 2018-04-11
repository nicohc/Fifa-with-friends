class ClubsController < ApplicationController
  def all_clubs
    @clubs = Club.all
  end

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
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to club_path(@club)
  	else
      render 'edit'
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  private
  def club_params
    params.require(:club).permit(:id, :name, :image_url)
  end
end
