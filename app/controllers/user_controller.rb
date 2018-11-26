require_relative '../models/post.rb'
class UserController < ApplicationController

  def user
    p params
    @posts = get_posts_by_id(params[:id])
    p "here are our posts:  "
    p @posts
    render :file => '../views/timeline.html.erb'
  end

  def get_posts_by_id(id)
    Post.where(user_id: id)
  end

end
