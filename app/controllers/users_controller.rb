class UsersController < ApplicationController
  def index
    @users = User.where(type_of_user: "artist")
  end

  def show

  end

  def new

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :statement, :avatar_url, :photo_url, :type_of_user)
  end
end
