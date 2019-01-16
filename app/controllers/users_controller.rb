# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friendships.map do |row|
      User.find(row.friend_id)
    end
  end

  def remove
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to new_user_registration_url, notice: 'User deleted.' if @user.destroy
  end
end
