module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path unless current_user
  end

  def current_user?(user)
    user == current_user
  end

  def correct_user
    @user = User.find_by(id: params[:user_id])
    unless current_user && current_user?(@user)
      redirect_to login_path
    end
  end


end
