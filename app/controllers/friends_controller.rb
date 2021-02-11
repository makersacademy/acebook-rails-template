class FriendsController < ApplicationController
  def index
    @received_requests = Friend.find_by(receiver_id: session[:user]["id"], status: "Pending")
    @sent_requests = Friend.find_by(requester_id: session[:user]["id"], status: "Pending")
  end

  def create
    @friend_request = Friend.create(friend_params)
    respond_to do |format|
      format.html do
        flash[:primary] = "Sent friend request!"
        redirect_back fallback_location: "/"
      end
      format.js
      format.json{ render json: @friend_request }
    end
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
    begin
      friend_request = Friend.find(friend_params["id"])
    rescue => exception
      flash[:danger] = exception
    else
      friend_request.destroy
      flash[:primary] = "Deleted friend request!"
    ensure
      redirect_back fallback_location: "/"
    end
  end

  private
  
  def friend_params
    friend_request = params.permit(:friend).permit(:id)
    friend_request[:id] ||= params[:id]
    friend_request[:receiver_id] ||= params[:user_id]
    friend_request[:requester_id] ||= session[:user]["id"]
    #p friend_request
    return friend_request
  end
end
