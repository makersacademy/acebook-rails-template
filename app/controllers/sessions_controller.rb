class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      redirect_to '/posts', notice: 'Successfully logged in'
    else
      redirect_to '/login', notice: 'Invalid login details'
    end
  end
end