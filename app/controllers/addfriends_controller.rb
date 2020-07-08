class AddfriendsController < ApplicationController
  def index
  # pull data from database
  params[:id] = session[:user_id]
  @current_user = User.find_by(id:  session[:user_id])  #current user set from session id. 
  
  end

end
