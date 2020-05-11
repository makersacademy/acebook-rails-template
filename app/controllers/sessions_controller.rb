class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id

      redirect_to posts_path
    else 
      flash[:warning] = "Incorrect email/password"
      render 'new'
    end

  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
