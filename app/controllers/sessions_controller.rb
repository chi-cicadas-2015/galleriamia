class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      @error_message = "Please fill in all the fields to log in."
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
