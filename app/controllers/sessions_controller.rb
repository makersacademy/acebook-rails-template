class SessionsController < ApplicationController
  before_action only: [:new, :create, :destroy]
  
  def new
  end

  def create
    @user = User.authenticate(email: params[:email], password: params[:password])
    if @user 
      session[:user_id] = @user.id
      render json: {
        status: :created,
        logged_in: :true,
        user: @user
      }
    else
      render json:{status: 401}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
