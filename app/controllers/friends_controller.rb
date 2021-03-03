class FriendsController < ApplicationController

  def index
    # requested_friends
    # pending friends 
    # friends
  end

  def create 
    current_user.friend_request(User.find(params[:id]))
    redirect_to user_path(params[:id])
  end

  def requests
    @friend_requests = current_user.requested_friends
  end

  def destroy 
  end

end
