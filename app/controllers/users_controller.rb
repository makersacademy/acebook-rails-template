class UsersController < ApplicationController
  protect_from_forgery

  def create
    redirect_to posts_url
  end
end
