class PiecesController < ApplicationController
  include ApplicationHelper
  before_action :authorize, :authorized_for_collection_actions, only: [:new, :create, :edit, :update, :destroy]

  def show
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    @piece = Piece.find_by(id: params[:id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    @piece = Piece.new
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    @piece = Piece.find_by(id: params[:id])
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

  def update
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:collection_id])
    updates = piece_params
    @piece = Piece.find_by(id: params[:id])
    if @piece.update_attributes(updates)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @piece = Piece.find(params[:id])
    if @piece.destroy
      redirect_to @user
    else
      render 'edit'
    end
  end

  def allocate

    if request.xhr?
      @user = User.find(params[:user_id])
      render "_add_collections.html.erb", layout: false
    else
      @user = User.find_by(id: params[:user_id])
      @collection = Collection.find_by(id: params[:collection_id])
      @piece = Piece.find(params[:id])
      redirect_to @user
    end
  end

  def add_to_collection

  end

  private
    def piece_params
      params.require(:piece).permit(:title, :size, :medium, :description, :photo, :artist_id, :year)
    end

end
