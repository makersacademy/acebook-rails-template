class UsersController < ApplicationController

  protect_from_forgery
  def new
    @user = User.new
  end

  def create
    if user_params[:email] =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
      @user = User.create(user_params)
      flash[:success] = "Congratulations, you are signed up!"
      redirect_to posts_url
    else
      flash[:bad_email] = "This email address is invalid"
      redirect_to('/users/new')

    end
  end

private

  def user_params
    params.require(:user).permit([:email, :password])
  end
end
