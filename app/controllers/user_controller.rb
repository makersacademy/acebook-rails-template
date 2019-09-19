class UserController < ApplicationController
  def index
    @user_class = User
    @user = User.find(params[:id])
    @posts = Post.all.order("created_at DESC")
    if @posts.first == nil
      @select_posts = @posts
    else
      @select_posts = @posts.select { |post| post.wall_id == params[:id]}
    end
  end
end
