# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    authenticate_user
  end

  def new
  end

  def create
  end

  def show
    authenticate_user
    @user = User.find(params[:id])
    @posts = []

    User.all.find do |user| 
      user.posts.find do |post| 
        if post.wall_id == @user.id
          @posts.append(post)
        end
      end
    end

    # @posts = @user.posts
  end

  private

  def authenticate_user
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
