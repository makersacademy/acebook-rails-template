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

   def friends

     "Hello world"
     redirect_to
    end
end
