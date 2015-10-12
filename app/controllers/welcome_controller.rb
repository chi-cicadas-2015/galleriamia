class WelcomeController < ApplicationController

  def index
  end

  def search
    @query = params[:query]
    @artist_results = User.where("(artist = ?) AND (lower(name) LIKE ?)", true, "%#{@query.downcase}%")
    @collection_results
    @piece_results
    @tag_results
  end

end
