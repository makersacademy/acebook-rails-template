class SessionsController < ApplicationController
  #new
  #create
  
  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "Successfully signed out"
    redirect_to root_url
  end
end
