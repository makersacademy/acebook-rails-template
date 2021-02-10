class FriendsController < ApplicationController
  def index
    @requests = Friend.find_by(receiver_id: session[:user]["id"], status: "Pending")
  end

  def create
    Friend.create!(friend_params)
    redirect_back fallback_location: "/"
  end

  def update
    friend_request = Friend.find_by(friend_params)
    friend_request.status = "Accepted"
    friend_request.save
    redirect_back fallback_location: "/"
  end

  def destroy
    friend_request = Friend.find_by(friend_params)
    friend_request.destroy
    redirect_back fallback_location: "/"
  end

  private
  
  def friend_params
    friend_request = params.require(:friend).permit(:id)
    friend_request[:receiver_id] = params[:user_id]
    friend_request[:requester_id] = session[:user]["id"]
    return friend_request
  end
end
