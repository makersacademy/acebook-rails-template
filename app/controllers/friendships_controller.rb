class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to root_url
      else
        flash[:error] = "Error occurred when adding friend."
        redirect_to root_url
      end
   end

  def destroy
    Friendship.find(params[:id]).destroy
    # @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end
end
