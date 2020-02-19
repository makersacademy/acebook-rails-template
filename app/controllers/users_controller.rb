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
    @results = User.filter(User.all, @user)
    @posts = User.reverse_posts(@results)
  end

  private

  def authenticate_user
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
