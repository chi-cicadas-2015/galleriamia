class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to artists_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
