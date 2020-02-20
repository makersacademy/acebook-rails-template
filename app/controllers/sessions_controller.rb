class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :login, :welcome, :create]
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_page_path(user.id)
    else 
      flash[:notice] = "Email or Password not valid"
      render 'new'
    end 
  end

  def login
  end

  def welcome
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', alert: "You have successfully logged out"
  end

end
