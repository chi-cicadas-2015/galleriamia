class FriendsController < ApplicationController

  def new
    @friend = User.find_by(id: params[:user_id])
    @user = User.find_by(id: session[:user_id])
    @friendship = Friend.create!(user_id: @user.id, friend_id: @friend.id)
    @user.friends << @friendship
    redirect_to @friend
  end

  def edit
    @friend = User.find_by(id: params[:user_id])
    @friendship = Friend.where(user_id: params[:id], friend_id: params[:user_id])
    Friend.destroy(@friendship)
    redirect_to @friend
  end

end
