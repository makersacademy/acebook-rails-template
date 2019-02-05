# frozen_string_literal: true

class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def index
    current_user = User.find_by_id(session[:current_user_id])
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.select{|p| p.user_id == @user.id }
  end

  def create
    # render plain: params[:users].inspect
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      @user.errors.full_messages.to_s
      render 'new'
    end
  end

  private

  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
