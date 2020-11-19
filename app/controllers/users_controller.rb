class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    if User.email_and_username_in_use?(user_params["username"], user_params["email"])
      error_response("Email and username")
    elsif User.email_in_use?(user_params["email"])
      error_response("Email")
    elsif User.username_in_use?(user_params["username"])
      error_response("Username")
    elsif !User.valid_email?(user_params["email"])
      flash[:warning] = "#{user_params["email"]} is not a valid email address"
      redirect_to('/users/new')
    elsif !User.valid_password?(user_params["password"])
      flash[:warning] = "Password must be between 6-10 characters"
      redirect_to('/users/new')
    else
      @user = User.create(user_params)
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome #{user_params["full_name"]}"
      redirect_to posts_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :email, :password)
  end

  def error_response(identifier)
    flash[:warning] = "#{identifier} already in use."
    redirect_to('/users/new')
  end
end
