class FriendshipsController < ApplicationController

  def index
    @friendship = Friendship.all
  end

  def new

  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend request sent."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end


end
