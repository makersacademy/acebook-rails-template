class SessionsController < ApplicationController
<<<<<<< HEAD
include BCrypt

  def create
    user = User.find_by_email(login_params[:email])

    p user.password == login_params[:password]

    if user.password == login_params[:password]
      session[:user_id] = user.id
      redirect_to posts_url
    else
      flash[:login_errors] = ['invalid credentials']
      redirect_to '/'
    end
  end 


  private
    def login_params
      params.require(:login).permit(:email, :password)
    end 
=======
  skip_before_action :redirect_if_not_logged_in, only: [:new,:login,:welcome, :create]
  
  def new
    p '------ I AM IN NEW ----------'
  end

  def create
    user = User.find_by_email(params[:email])
    p user 
    if user && user.authenticate(params[:password])
      p '------ I AM IN THE IF BLOCK ----------'
      session[:user_id] = user.id 
      # redirect_to posts_url, notice: "Your are Logged in!"
    else 
      flash.now[:alert] = "Email or Password not valid"
      render "login"
    end 
  end

  def login
  
  end

  def welcome

  end
>>>>>>> post_noGecko
end
