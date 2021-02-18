class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to action: "login"
  end

  def authenticate
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      flash[:primary] =  "You have logged in!"
    else
      flash[:danger] =  "Incorrect username or password"
      # if invalid login, flashes error message & goes back to users/login
    end
    redirect_back fallback_location: "/"
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
