class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @messages = Message.all
    @message = Message.new
  end

  def nonfriends
    @friends = Friendship.where(user_id: current_user).map { |x| x.friend_id }
    @friends.push(current_user.id)
    p @friends
    @non_friends = User.where.not(id: @friends)
    p @non_friends
  end
end
