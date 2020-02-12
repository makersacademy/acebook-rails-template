# frozen_string_literal: true

class UsersController < ApplicationController
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

  private

  def article_params
    params.require(:user).permit(:email, :password)
  end
end
