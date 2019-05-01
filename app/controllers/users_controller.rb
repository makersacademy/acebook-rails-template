# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def addfriend
    @user = User.find(params[:user_id])
    current_user.friend_request(@user)
    flash[:success] = "You have sent #{@user.email} a friend request!"
    redirect_to users_url
  end

  def friend_requests
    @users = current_user.requested_friends
  end

  def acceptfriend
    @user = User.find(params[:user_id])
    current_user.accept_request(@user)
    flash[:success] = "You have accepted a friend request from #{@user.email}"
    redirect_to user_friend_requests_url
  end

end
