class SessionsController < ApplicationController

  def new
    # @session = Session.new
  end

  def create
    user = User.find_by_email(params[:email])

    p params
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
