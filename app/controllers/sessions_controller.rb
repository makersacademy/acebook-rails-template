class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}"
      redirect_to posts_path
    else
      flash[:notice] = 'Invalid credentials'
      redirect_to new_session_path
    end
  end
  
  # private
  #
  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end
end
