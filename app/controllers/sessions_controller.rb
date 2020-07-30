class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def login
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/posts'
    else
        @error = "Sorry, please try again"
        p !@error.nil?
       render 'new'
    end
  end

  def welcome
  end

  def page_requires_login
  end

end
