# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
end
