class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.create(:friend_id => params[:friend_id])
    if @friendship
      p "here"
      # User.find(params[:friend_id]).friendships.create(:friend_id => current_user.id)
      flash[:notice] = "Added friend."

    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to users_path
  end


  private

  def post_params
    params.require(:friendship).permit(:friend_id)
  end
end
