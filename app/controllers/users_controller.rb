class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authorize, :authorized_for_user_actions, only: [:edit, :update]

  def show
    @user = User.find_by(id: params[:id])
    @collections = Collection.where(user_id: @user.id)
    @friends = Friend.where(user_id: @user.id)
  end

  def index
    @artists = User.where(artist: true)
  end

  def new
    @user = User.new
  end

  def create
    params[:user].merge!(artist: params[:artist])
    @user = User.new(user_params)
    if @user.save
      create_default_collection(@user.id)
      session[:user_id] = @user.id
      if @user.artist?
        redirect_to artist_details_user_path(@user)
      else
        flash[:message] = "Your account was saved successfully"
        redirect_to artists_path
      end
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
      @user = User.find(params[:id])
      @profile = Profile.find_by(user_id: @user.id)
  end

  def update
    @user = User.find_by(id: params[:id])
    @old_avatar = @user.avatar
    @old_headshot = @user.profile.headshot

    if @user.artist
      update_artist(@user, @old_avatar, @old_headshot)
    else
      update_user(@user, @old_avatar)
    end
  end

  def random_artist
    artists = User.where(artist: true)
    @user = artists.sample
    redirect_to @user
  end

  private
  def create_default_collection(user_id)
    Collection.create!(user_id: user_id, name: "Portfolio")
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :statement, :artist, :avatar)
  end

  def artist_params
    params.require(:user).permit(:name, :email, :password, :statement, :artist, :avatar, profile_attributes: [:top_collection, :website_url, :primary_medium, :headshot])
  end

  def update_artist(user, avatar, headshot)
    if user.update(artist_params)
      redirect_to user
    else
      @errors = user.errors.full_messages
      render 'edit'
    end
  end

  def update_user(user, avatar)
    if user.update(user_params)
      redirect_to user
    else
      @errors = user.errors.full_messages
      render 'edit'
    end
  end

end
