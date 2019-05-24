class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to '/posts'
  else
    flash.now[:error] = 'Incorrect email/password'
    render 'new'

    end
  end
end
