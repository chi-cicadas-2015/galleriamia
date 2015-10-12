class WelcomeController < ApplicationController

  def index
  end

  def search
    @query = params[:query]
    @artist_results = User.where(["artist='%s' AND name='%s'", true, @query])
    @collection_results
    @piece_results
    @tag_results
  end

end
