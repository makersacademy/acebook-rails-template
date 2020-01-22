class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.create(:friend_id => params[:friend_id])
    if @friendship
      flash[:notice] = "Added friend."
    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to friendships_path
  end

  def index
    @user = User.find(session[:recipient_id])
    @friends = @user.friends + @user.inverse_friends
    @non_friends = User.all - @friends - [@user]
  end 

  def destroy
    @friendship = Friendship.find(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship.destroy
    redirect_to friendships_path
  end

  private

  def post_params
    params.require(:friendship).permit(:friend_id)
  end
end
