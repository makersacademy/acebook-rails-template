class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(like_params.merge(liker: current_user.id))
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to posts_path
  end

  private
    def like_params
      params.require(:like).permit(:liker)
    end
end
