# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login

  protect_from_forgery
  def new
    @user = User.new
  end

  def index
    # @posts = Post.all
    @current_user_id = current_user.id
    @posts = Post.where("user_id = #{@current_user_id}")
  end

  def create
    if /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.match?(user_params[:email])
      @user = User.create(user_params)
      if !@user.id.nil?
        log_in(@user)
        flash[:success] = 'Congratulations, you are signed up!'
        redirect_to posts_url
      else
        flash[:fail_duplicate_email] = 'This email already registered. Please log in!'
        redirect_to '/login'
      end
      # redirect_to posts_url
    else
      flash[:bad_email] = 'This email address is invalid'
      redirect_to('/users/new')
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[email password])
  end
end
