class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      puts  session[:user_id]
      redirect_to user_path(user.id)
      # redirect to user/user.id
  
    end
  end

#  def show 
#  end 

end
