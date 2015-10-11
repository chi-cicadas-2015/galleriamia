class ArtistsController < ApplicationController

  def index
    @artists = User.where(artist: true)
  end

  def show
    @artist = User.find_by(id: params[:id])
    @collections = Collection.where(user_id: params[:id])
  end

  private
  def artist_params
    params.require(:user).permit(:name, :email, :password, :statement, :avatar_url, :photo_url, :artist)
  end

end
