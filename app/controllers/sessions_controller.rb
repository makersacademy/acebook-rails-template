class SessionsController < ApplicationController

  skip_before_action :authorised, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id]= @user.id
      
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  # def login

  # end

  def welcome

  end
end
