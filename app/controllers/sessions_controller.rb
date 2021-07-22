class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(usernamie: paramas[:username])
    if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end
end
