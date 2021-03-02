class LikesController < ApplicationController
  before_action :find_post


  def create
  p @post
  @post.likes.create(user_id: current_user.id)
  redirect_to post_path(@post)
  end

  def find_post
     @post = Post.find(params[:post_id])
 end

end
