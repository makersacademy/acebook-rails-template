class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email_address].downcase)
    if user # need to authenticate here as well
      redirect_to posts_path
    else
      redirect_to login_path
      # show an error message
    end
  end
  
  def destroy
  end
end
