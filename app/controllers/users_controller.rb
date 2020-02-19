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
    @results = []
    
    User.all.each do |user| 
      user.posts.each do |post|
        if post.wall_id == @user.id
          @results.append(post)
        elsif (post.wall_id == nil) && (post.user_id == @user.id)
          @results.append(post)
        end
      end
    end

    @posts = User.reverse_posts(@results)

  end

  private

  def authenticate_user
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
