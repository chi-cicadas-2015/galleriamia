class PiecesController < ApplicationController

  def new
    @piece = Piece.new
  end


  private
    def piece_params
      params.require(:piece).permit(:title, :size, :medium, :desription, :photo)
    end

end