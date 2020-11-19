class SessionsController < ApplicationController
  # #create
  # ## click log in, db with the email return id current user id to their actual id 
  # encrypt passwords 

  def new

  end

  def create 
    # they log with their username:
    # if find_by_username(params["username"]) returns not nil - they are a user - if not throw flash message
    # check that their password matches their username, if not throw flash message, but we also need to encrypt the password
    @current_user = User.find_by_username(user_params["username"])
    p user_params["password_digest"]

    if @current_user.nil?
      flash[:notice] = "The username #{user_params["username"]} does not exist"
      redirect_to('/sessions/new')
      # link to sign up - incase they haven't already
    elsif ((@current_user.authenticate(user_params["password_digest"])) == false)
      flash[:notice] = "Username and password do not match, please try again"
      redirect_to('/sessions/new')
      # password authentication - bcrypt
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
    params.require(:password_digest)
    params.permit(:username, :password_digest)
  end
end
