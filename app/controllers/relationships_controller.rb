class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    current_user = User.find(session[:current_user])
    current_user.follow(user)
    redirect_to '/home'
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user = User.find(session[:current_user])
    current_user.unfollow(user)
    redirect_to '/home'
  end
end