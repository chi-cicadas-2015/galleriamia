class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path
    else
      @error_message = "Please fill out each form to sign up."
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end