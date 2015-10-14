class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authorize, :correct_user, only: [:edit, :update]

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

    #if both are full
    if params[:user].include?("avatar") && params[:user][:profile_attributes].include?("headshot")
      if @user.update(user_params)
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
    #if only avatar is empty
    elsif params[:user].exclude?("avatar") && params[:user][:profile_attributes].include?("headshot")
      params[:user].merge!(avatar: @old_avatar)
      if @user.update(user_params)
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
    #if only headshot is empty
    elsif params[:user].include?("avatar") && params[:user][:profile_attributes].exclude?("headshot")
      params[:user][:profile_attributes].merge!(headshot: @old_headshot)
      # raise params[:user][:profile_attributes].inspect
      if @user.update(user_params)
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
    #if both are empty
    else
      params[:user].merge!(avatar: @old_avatar)
      params[:user][:profile_attributes].merge!(headshot: @old_headshot)
      if @user.update(user_params)
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
    end

  end

  def random_artist
    artists = User.where(artist: true)
    @user = artists.sample
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :statement, :artist, :avatar, profile_attributes: [:top_collection, :website_url, :primary_medium, :headshot])
    end



    def create_default_collection(user_id)
      Collection.create!(user_id: user_id, name: "Portfolio")
    end

end
