class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    if email_and_username_not_unique?(user_params["username"], user_params["email"])
      error_response("Email and username")
    elsif email_not_unique?(user_params["email"])
      error_response("Email")
    elsif username_not_unique?(user_params["username"])
      error_response("Username")
    elsif invalid_email?(user_params["email"])
      flash[:warning] = "#{user_params["email"]} is not a valid email address"
      redirect_to('/users/new')
    # elsif invalid_password?(user_params["password"])
    #   flash[:warning] = "Password must be between 6-10 characters"
    #   redirect_to('/users/new')
    else
      @user = User.create(user_params)
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome #{user_params["full_name"]}"
      redirect_to posts_url
    end
  end

  private
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   

  def invalid_email?(email)
    !(email =~ VALID_EMAIL_REGEX)
  end

  def invalid_password?(password)
    ((password.length < 6) || (password.length > 10))
  end

  def user_params
    params.require(:user).permit(:username, :full_name, :email, :password)
  end

  def email_and_username_not_unique?(email, username)
    email_not_unique?(email) && username_not_unique?(username)
  end

  def email_not_unique?(email)
    !User.find_by_email(email).nil? 
  end

  def username_not_unique?(username)
    !User.find_by_username(username).nil?
  end

  def error_response(identifier)
    flash[:warning] = "#{identifier} already in use."
    redirect_to('/users/new')
  end
end
