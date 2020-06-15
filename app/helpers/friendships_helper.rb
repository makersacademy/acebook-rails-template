# frozen_string_literal: true

module FriendshipsHelper
  def already_friends?(current_user, friend)
    user_has_friend = current_user.friendships.map do |friendship|
                       friendship.friend_id
    end.include?(friend.id)
    return user_has_friend
  end
end
