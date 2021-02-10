class FriendsController < ApplicationController
  def create
    Friend.create!(friend_params)
    redirect_back fallback_location: "/"
  end

  private
  
  def friend_params
    comment = params.require(:friend).permit
    comment[:receiver_id] = params[:user_id]
    comment[:requester_id] = session[:user]["id"]
    return comment
  end
end
