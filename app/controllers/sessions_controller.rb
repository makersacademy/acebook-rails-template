class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    redirect_to '/posts'
  else

    render 'new'
    flash.now[:success] = 'Incorrect email/password'
    end
  end
end
