class FriendsController < ApplicationController
  def index
    @requests = Friend.find_by(receiver_id: session[:user]["id"], status: "Pending")
  end

  def create
    Friend.create!(friend_params)
    redirect_back fallback_location: "/"
  end

  def update
    begin
      friend_request = Friend.find(friend_params["id"])
    rescue => exception
      flash[:danger] = exception
    else
      friend_request.status = "Accepted"
      friend_request.save
      flash[:primary] = "Accepted friend request!"
    ensure
      redirect_back fallback_location: "/"
    end
  end

  def destroy
    friend_request = Friend.find(friend_params["id"])
    friend_request.destroy
    redirect_back fallback_location: "/"
  end

  private
  
  def friend_params
    friend_request = params.permit(:friend).permit(:id)
    friend_request[:id] = params[:id]
    friend_request[:receiver_id] = params[:user_id]
    friend_request[:requester_id] = session[:user]["id"]
    return friend_request
  end
end
