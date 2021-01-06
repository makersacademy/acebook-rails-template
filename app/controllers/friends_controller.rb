class FriendsController < ApplicationController
  def requests
    @friend_requests = current_user.requested_friends
  end

  def accept
    current_user.accept_request(User.find(params[:id]))
    redirect_to friend_requests_path
  end
end
