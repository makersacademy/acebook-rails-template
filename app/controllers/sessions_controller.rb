class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path("#{user.id}")
    else
      flash[:notice] = 'Invalid credentials'
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    flash[:notice] = 'You have logged out'
    redirect_to new_session_path
  end
end
