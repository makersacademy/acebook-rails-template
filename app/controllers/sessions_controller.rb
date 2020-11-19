class SessionsController < ApplicationController
  # #create
  # ## click log in, db with the email return id current user id to their actual id 
  # encrypt passwords 

  def new

  end

  def create 
    @current_user = User.find_by_username(user_params["username"])

    if user_not_recognised?
      flash[:notice] = "The username #{user_params["username"]} does not exist"
      redirect_to('/sessions/new')
      # link to sign up - incase they haven't already
    elsif failed_password_authentication?(user_params["password"])
      flash[:notice] = "Username and password do not match, please try again"
      redirect_to('/sessions/new')
    else
      session[:current_user_id] = @current_user.id
      redirect_to posts_url
    end
  end
  
  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "Successfully signed out"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:username)
    params.require(:password)
    params.permit(:username, :password)
  end

  def failed_password_authentication?(password)
    (@current_user.authenticate(user_params["password"])) == false
  end

  def user_not_recognised?
    @current_user.nil?
  end
end
