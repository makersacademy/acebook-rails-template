class FriendshipsController < ApplicationController
  before_action :check_friendship, only: :create
  
  def new
    @friendship = Friendship.new
  end
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
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end
  private
  def check_friendship
    redirect_to( current_user, alert: 'Already a friend' ) if current_user.friend_with?( params[ :friend_id ] )
  end
end
