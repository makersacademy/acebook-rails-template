class FriendshipsController < ApplicationController
  def search
    if params[:search]
      firstword = params[:search].split(' ').first
      lastword = params[:search].split(' ').last

      @results = User.where(["firstname LIKE ? OR lastname LIKE ?", "#{firstword}", "#{lastword}"])
    end
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
