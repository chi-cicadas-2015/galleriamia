class UsersController < ApplicationController

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

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
