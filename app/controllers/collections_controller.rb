class CollectionsController < ApplicationController

  def new
    @collection = Collection.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    params[:collection].merge!(user_id: params[:user_id])
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to @user
    else
      @errors = @collection.errors.full_messages
      render 'new'
    end
  end

  def edit
    @collection = Collection.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:id])

    if @collection.update(collection_params)
      redirect_to user_path(@user.id)
    else
      @errors = @collection.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @collection = Collection.find_by(id: params[:id])
    @collection.destroy

    redirect_to user_path(@user.id)
  end

  private
  def collection_params
    params.require(:collection).permit(:user_id, :name, :description)
  end
end
