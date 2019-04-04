class SigninController < ApplicationController
  def index
    # @user = Signup.find_by(username: params[:username])
end

  def new
  end

  def create
    session[:user_id] = nil
    @user = Signup.find_by(username: params[:signin][:username])
    if @user && @user.authenticate(params[:signin][:password])
      session[:user] == @user.id
      session[:current_user] = @user
      redirect_to posts_url
    else
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to "/signin"
  end

end
