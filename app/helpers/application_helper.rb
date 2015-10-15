module ApplicationHelper

  def authenticated?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if authenticated?
  end

  def authorize
    unless authenticated?
      redirect_to login_path
    end
  end

  def authorized_for_user_actions
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to login_path
    end
  end

  def authorized_for_collection_actions
    @collection = Collection.find_by(user_id: params[:user_id])
    unless current_user.id == @collection.user_id
      redirect_to login_path
    end
  end

  def authorized_for_piece_actions
    @piece = Piece.find_by(artist_id: params[:user_id])
    unless current_user.id == @piece.artist_id
      redirect_to login_path
    end
  end
end
