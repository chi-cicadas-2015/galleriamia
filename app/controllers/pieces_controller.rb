class PiecesController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    @piece = Piece.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    params[:piece].merge!(artist_id: params[:user_id])
    @piece = Piece.new(piece_params)
    if @piece.save
      @collection.pieces << @piece
      redirect_to @user
    else
      @errors = @piece.errors.full_messages
      render 'new'
    end
  end

  private
    def piece_params
      params.require(:piece).permit(:title, :size, :medium, :description, :photo, :artist_id)
    end

end