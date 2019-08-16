# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to MugManual!'
      redirect_to posts_path # needs changing to homepage
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      session[:wall_id] = params[:id]
      @post = Post.new
      # @wall_post =  Post.find_by(wall_id: @user.id)
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
