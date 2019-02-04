class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Log user in to profile
    else
    flash.now[:danger] = "Invalid details you cretin"
    render 'new'
    end
  end

end
