class UsersController < ApplicationController
  def new
  end

  def create
    redirect_to posts_path
  end
end
