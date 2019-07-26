class SessionsController < ApplicationController
  skip_before_action :require_signup

  def new
    redirect_to user_posts_path(current_user) unless current_user.nil?
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      (redirect_to user_posts_path(current_user)) && return
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
