class UsersController < ApplicationController

  def index
    @artists = User.where(artist: true)
  end

  def show
    @user = User.find_by(id: params[:id])
    @collections = Collection.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Your account was saved successfully"
      redirect_to artists_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  def random_artist
    artists = User.where(artist: true)
    @user = artists.sample
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end

end
