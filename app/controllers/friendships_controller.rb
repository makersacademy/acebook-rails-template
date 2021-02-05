class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friendships
    @inversefriendships = current_user.inverse_friendships
    #@friendship = Friendships.find(params[:friend_id])
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

  def destroy
    @friendship = current_user.friendship.find(params[:friend_id])
    @friendship.destroy
    flash[:notice]= "successfully deleted friend"
    redirect_to root_url
  end

  def status
    @inversefriendship = current_user.inverse_friendships
  end

  def put
    @friendships.all
  end

  def accept
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.update(status: true)
    redirect_to root_url
  end
  
  def decline
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.update(status: false)
    redirect_to root_url
  end
end
