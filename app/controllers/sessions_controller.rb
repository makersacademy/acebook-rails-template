class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/walls'
    else
        @error = "Sorry, please try again"
        p !@error.nil?
       render 'welcome'
    end
  end

  def logout
    p @user
    session.delete(:user_id)
    @user = nil
    p @user
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
