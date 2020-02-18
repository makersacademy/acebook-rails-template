class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new,:login,:welcome, :create]
  
  def new # action - links/maps to localhost:3000/session/new
    
  end

  def create # CRUD method - to create a session
    user = User.find_by_email(params[:email]) # find the user by their email
    if user && user.authenticate(params[:password]) # if the user i
      session[:user_id] = user.id
      redirect_to posts_url
    else 
      flash[:notice] = "Email or Password not valid"
      render 'new' # renders the welcome page
    end 
  end

  def login # login action - links to localhost:3000/login
  end

  def welcome # action - links to localhost:3000/welcome
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', alert: "You have logged out"
  end


end
