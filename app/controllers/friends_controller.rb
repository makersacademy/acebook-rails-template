class FriendsController < ApplicationController
  def index
    @user = current_user
    @friends = @user.friends
    @requests = @user.requested_friends
    @pending = @user.pending_friends
  end

  def create
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.friend_request(friend)
  end

  def add
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.accept_request(friend)

    redirect_to friends_path
  end

  def reject
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.decline_request(friend)

    redirect_to friends_path
  end

  def remove
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.remove_friend(friend)

    redirect_to user_path(friend)
  end

  def search
    @search = params[:search].downcase
    @results = User.all.select do |user|
        user.name.downcase.include?(@search)
    end
  end
end
