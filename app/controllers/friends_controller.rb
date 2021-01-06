class FriendsController < ApplicationController
  def requests
    @friend_requests = current_user.requested_friends
  end
end
