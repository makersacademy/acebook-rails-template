class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.new(signup_params)

    if user.valid?
      user.save
      session[:user_id] = user.id

      (redirect_to posts_path) && (return)
    else
      (redirect_to root_path) && (return)
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end
end
