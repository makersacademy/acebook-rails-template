class UsersController < ApplicationController
  protect_from_forgery

  def create
    flash[:success] = "Congratulations, you are signed up!"
    redirect_to posts_url
  end
end
