class SessionsController < ApplicationController
  before_action only: [:new, :create, :destroy]
  
  def new
    render json: { status: "It's working!" }
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if !@user
        render json: { status: 'Email or Password is incorrect. Try again, or sign up!' }
    else
      session[:user] = @user
      render json: {
          status: :created,
          logged_in: :true,
          user: @user
        }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
