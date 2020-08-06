class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :login]


  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/' + current_user.id.to_s
    elsif !@user
      flash[:alert] = "sEa-mail address dopes not exist - please sign up"
      redirect_to '/login'
    else
      flash[:alert] = "FINcorrect Password"
      redirect_to '/login'
    end

  end

  def login
  end

  def welcome
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url
  end
end
