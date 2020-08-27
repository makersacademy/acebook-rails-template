class SessionsController < ApplicationController
  def new
    render "new"
  end
  def create
    session[:id] = @user.id
  end
end
