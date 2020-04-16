class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    new_friend = User.find(params[:friend_id]).friendships.build(:friend_id => current_user.id)
      if @friendship.save && new_friend.save
        flash[:notice] = "Added friend"
        redirect_to users_url
      else
        flash[:error] = "Error occurred when adding friend"
        redirect_to users_url
      end
   end

  def destroy
    friendship = Friendship.find(params[:id])
    a = Friendship.find_by(user_id: friendship.user_id, friend_id: friendship.friend_id)
    b = Friendship.find_by(user_id: friendship.friend_id, friend_id: friendship.user_id)
    a.destroy
    b.destroy
    flash[:notice] = "Successfully unfriended friend"
    redirect_to current_user
  end
end
