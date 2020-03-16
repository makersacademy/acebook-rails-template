class SessionsController < ApplicationController
  def new
  end

  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.password == params[:session][:password]
    #   # log the user in
    # else
    #   render 'new'
    # end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'You have successfully logged out. Don\'t let the flap hit you on the way out.'
    redirect_to root_url
  end
end
