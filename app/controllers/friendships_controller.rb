class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    @user = User.find(params[:friend_id])

    if @friendship.save
      redirect_to user_path(@user)
      flash[:notice] = "Added friend."
    else
      redirect_to user_path(@user)
      flash[:notice] = "Unable to add friend."
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to user_path(current_user)
    flash[:notice] = "Removed friendship."
  end
end
