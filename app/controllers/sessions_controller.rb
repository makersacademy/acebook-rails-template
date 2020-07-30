class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/posts'
    else
       redirect_to '/login'
    end
  end

  def logout
    session.delete(:user_id)
    @user = nil
  end

  def destroy
    logout
    redirect_to root_url
  end

  def welcome
  end

  def page_requires_login
  end

end
