class SessionsController < ApplicationController
  def new
  end
  
  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    # if user # need to authenticate here as well
    # else
    #   # show an error message
    # end
    redirect_to posts_path
  end
  
  def destroy
  end
end
