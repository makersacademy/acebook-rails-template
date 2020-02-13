class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new,:login,:welcome, :create]
  
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url
    # else 
    #   flash[:alert] = "Email or Password not valid"
    #   render :welcome
    end 
  end

  def login
  end

  def welcome
  end


end
