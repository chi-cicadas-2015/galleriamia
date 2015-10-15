class FriendsController < ApplicationController

  def show

  end

  def new
    @friend = User.find_by(id: params[:user_id])
    @user = User.find_by(id: session[:user_id])
    @friendship = Friend.create!(user_id: @user.id, friend_id: @friend.id)
    @user.friends << @friendship
    redirect_to @friend
  end

  def destroy

  end

  private
  def friend_params

  end
end
