class WelcomeController < ApplicationController

  def index
  end

  def search
    @query = params[:query]
    @artist_results = User.where("(artist = ?) AND (lower(name) LIKE ?)", true, "%#{@query.downcase}%")
    @collection_results = Collection.where("(lower(name) LIKE ? OR lower(description) LIKE ?)", "%#{@query.downcase}%", "%#{@query.downcase}%")
    @tag_results = Tag.where("lower(name) LIKE ?", "%#{@query.downcase}%")
  end

end
