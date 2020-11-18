class SessionsController < ApplicationController
  # #create
  # ## click log in, db with the email return id current user id to their actual id 

  def new
    
  end

  # def create

  # end
  
  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "Successfully signed out"
    redirect_to root_url
  end
end
