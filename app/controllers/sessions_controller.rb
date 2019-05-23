class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to '/posts'
  end
end
