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
    flash[:success] = "Ahhh! Yoda's little friend you seek!"
    redirect_to users_url
  end

  def friend_requests
    @users = current_user.requested_friends
  end

  def acceptfriend
    @user = User.find(params[:user_id])
    current_user.accept_request(@user)
    flash[:success] = "Good relations with the Wookiees, I have!"
    redirect_to user_friend_requests_url
  end

  def declinefriend
    @user = User.find(params[:user_id])
    current_user.decline_request(@user)
    flash[:success] = "Death is a natural part of life. Rejoice for those around you who transform into the Force."
    redirect_to user_friend_requests_url
  end

end
