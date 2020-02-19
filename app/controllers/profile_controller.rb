# frozen_string_literal: true

class ProfileController < ApplicationController
  def new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
end
