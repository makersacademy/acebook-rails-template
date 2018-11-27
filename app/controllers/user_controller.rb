require_relative '../models/post.rb'
class UserController < ApplicationController

  def user
    @posts = get_posts_by_id(params[:id])
    render :file => '../views/timeline.html.erb'
  end

  def get_posts_by_id(id)
    @user = User.find(id)
    @user.posts
  end

end
