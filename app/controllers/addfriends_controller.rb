class AddfriendsController < ActionController::Base
  def index
  # pull data from database
  params[:id] = session[:user_id]
  end

end
