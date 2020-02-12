class SessionsController < ApplicationController
include BCrypt

  def create
    user = User.find_by_email(login_params[:email])

    p user.password == login_params[:password]

    if user.password == login_params[:password]
      session[:user_id] = user.id
      redirect_to posts_url
    else
      flash[:login_errors] = ['invalid credentials']
      redirect_to '/'
    end
  end 


  private
    def login_params
      params.require(:login).permit(:email, :password)
    end 
end
