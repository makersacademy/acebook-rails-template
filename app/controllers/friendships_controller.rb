# frozen_string_literal: true

class FriendshipsController < ApplicationController
  skip_before_action :authenticated_user

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if current_user.id.to_s == params[:friend_id]
      flash[:alert] = "You can't befriend yourself"
    elsif already_friend?
      flash[:alert] = 'You are already friends'
    elsif @friendship.save
      flash[:notice] = 'Friend Added'
    else
      flash[:alert] = 'Unable to add friend'
    end
    redirect_to session[:url]
  end

  def show
    @friend_to = Friendship.where(user_id: current_user.id)
    @friend_from = Friendship.where(friend_id: current_user.id)
  end

  private

  def already_friend?
    Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).exists? ||
      Friendship.where(user_id: params[:friend_id], friend_id: current_user.id).exists?
  end
end
