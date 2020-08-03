class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def login
  end

  def welcome
  end

  def destroy
   # Remove the user id from the session
   current_user = session[:user_id] = nil  
   redirect_to root_url
  end
end
