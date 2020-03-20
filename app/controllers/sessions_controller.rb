class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_action :require_login
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      successful_session(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:success] = 'You have successfully logged out. Don\'t let the flap hit you on the way out.'
    redirect_to login_url
  end
end
