class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
    redirect_to posts_index_path
  end

  def destroy
  end
end
