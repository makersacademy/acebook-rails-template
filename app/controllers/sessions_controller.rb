class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
<<<<<<< HEAD
    if user&.authenticate(params[:session][:password])
=======
    if user && user.authenticate(params[:session][:password])
>>>>>>> sign in css
      log_in user
      redirect_to user   
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

<<<<<<< HEAD
  def destroy
    log_out
    redirect_to root_url 
  end
=======
  def destroy; end
>>>>>>> sign in css

end
