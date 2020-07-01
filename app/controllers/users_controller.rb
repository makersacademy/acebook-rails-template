class UsersController < ApplicationController

  def new
  end

  def create
    session[:user_name] = params[:user][:name]
    redirect_to posts_url
  end
end
