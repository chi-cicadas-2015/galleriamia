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

  def update

  end

  def destroy

  end

  private
  def collection_params
    params.require(:collection).permit(:user_id, :name, :description)
  end
end
