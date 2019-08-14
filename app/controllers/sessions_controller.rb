class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      p "to do next"
    else
    render 'new'
  end



  def destroy
  end
end
