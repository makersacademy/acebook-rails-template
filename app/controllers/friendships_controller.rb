# frozen_string_literal: true

class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception
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
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
    end
end
