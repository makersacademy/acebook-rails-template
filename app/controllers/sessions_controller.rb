class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_posts_path(user)

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Goodbye"
    redirect_to '/'
  end
end
