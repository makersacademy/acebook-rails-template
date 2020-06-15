class SigninController < ApplicationController
  def index
    # @user = Signup.find_by(username: params[:username])
end

  def new
  end

  def create
    @user = Signup.find_by(username: params[:signin][:username])
    if @user && @user.authenticate(params[:signin][:password])
      session[:user] == @user.id
      redirect_to posts_url
    else
      render 'new'
    end

  end

  def destroy
  end

end
