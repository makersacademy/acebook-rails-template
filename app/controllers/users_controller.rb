# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.friendships.map do |row|
      User.find(row.friend_id)
    end
  end

  def remove
    User.destroy(params[:format])

    redirect_to root_url, notice: 'User deleted.' if @user.destroy
  end
end
