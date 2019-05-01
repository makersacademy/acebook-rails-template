class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create!(user_id: current_user.id)
    redirect_to posts_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy

    redirect_to posts_path
  end

end
