# frozen_string_literal: true

class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @friend_requests = Friendship.where(user_id: current_user.id, confirmed: false).where.not(requester: current_user.id)
    @current_friends = Friendship.where(user_id: current_user.id, confirmed: true)
    @friend_ids_requests = @friend_requests.map { |friendship| 
    friendship.friend_id
    }
    @request_user_models = User.find(@friend_ids_requests)
  end

  def create
    if params.include?(:friend_id)
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
    else
      params[:user][:friend_ids].each do |f_id|
        @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, f_id)
      end
    end
    redirect_to '/'
  end

  def destroy
    @friendship_obj = Friendship.find(params[:id])
    if Friendship.destroy_reciprocal_for_ids(current_user.id, @friendship_obj.friend_id)
      flash[:notice] = "Friend Rejected/Removed"
    end
    redirect_to friendships_url
  end

  def update
    @friendship_obj = Friendship.find(params[:id])
    Friendship.confirm(current_user.id, @friendship_obj.friend_id)
    flash[:notice] = "Friend Confirmed"
    redirect_to friendships_url
  end

  def managefriends
    @current_friends = Friendship.where(user_id: current_user.id, confirmed: true)
    p @current_friends
    @friend_ids = @current_friends.map { |friendship| 
    friendship.friend_id
    }
    @user_models = User.where(id: @friend_ids)
  end
end
