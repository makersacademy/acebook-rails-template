class RelationshipsController < ApplicationController

  skip_before_action :require_login

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_posts_url(current_user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user_posts_url(current_user)
  end

end
