class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.find_by_email(user_params["email"]).nil?
      @user = User.create(user_params)
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome #{user_params["full_name"]}"
      redirect_to posts_url
    else
      flash[:warning] = "Email already in use."
      redirect_to('/users/new')
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :email, :password)
  end
end
