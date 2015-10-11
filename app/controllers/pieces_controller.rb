class PiecesController < ApplicationController

  def new
    @piece = Piece.new
  end

  def create
    @user = User.find_by(params[:id])
    @collection = @user.collections.find(params[:collection_id])
    @piece = Piece.new(piece_params)
    @collection << @piece
    if @piece.save
      redirect_to @user
    else
      @errors = @piece.errors.full_messages
      render 'new'
    end
  end

  private
    def piece_params
      params.require(:piece).permit(:title, :size, :medium, :description, :photo)
    end

end