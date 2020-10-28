class FriendshipsController < ApplicationController
  def addfriend
    @user = User.find(params[:id])
    current_user.friend_request(@user)
    redirect_back fallback_location: root_path
  end

  def unfriend
    @user = User.find(params[:id])
    current_user.remove_friend(@user)
    redirect_back fallback_location: root_path
  end

  def accept
    @user = User.find(params[:id])
    current_user.accept_request(@user)
    redirect_back fallback_location: root_path
  end

  def decline
    @user = User.find(params[:id])
    current_user.decline_request(@user)
    redirect_back fallback_location: root_path
  end

  def block
    @user = User.find(params[:id])
    current_user.block_friend(@user)
    redirect_back fallback_location: root_path
  end

  def unblock
    @user = User.find(params[:id])
    current_user.unblock_friend(@user)
    redirect_back fallback_location: root_path
  end

  def requests
    @pending = current_user.requested_friends
    @friends = current_user.friends
    @blocked = current_user.blocked_friends
  end
end
