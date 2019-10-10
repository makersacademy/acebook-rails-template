class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # if params[:session][:password] == "pass"
      # Log the user in and redirect to the user's show page.
      redirect_to '/posts'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
