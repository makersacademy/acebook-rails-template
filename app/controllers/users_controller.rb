# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, :only=>[:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(article_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def destroy
    @user = User.find(session[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end

  private

  def article_params
    params.require(:user).permit(:email, :password)
  end
end
