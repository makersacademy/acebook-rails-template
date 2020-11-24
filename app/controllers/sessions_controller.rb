class SessionsController < ApplicationController
  before_action only: [:new, :create, :destroy]
  include CurrentUserConcern
  
  def new
    render json: { status: "It's working!" }
  end

  def create
    @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      session[:user] = @user
      render json: {
        status: :created,
        logged_in: :true,
        user: @user
      }
    else
      render json: { 
        status: 401 
      }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: :true,
        user: @user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { status: "Logged out!" }
  end
end
