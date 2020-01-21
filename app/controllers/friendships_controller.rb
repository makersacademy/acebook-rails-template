class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.create(post_params)
    if @friendship
      flash[:notice] = "Added friend."
    else
      flash[:notice] = "Unable to add friend."
    end
  end


  private

  def post_params
    params_require(:friendship).permit(:friend_id)
  end
end
