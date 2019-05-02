class LikesController < ApplicationController
  before_action :find_likeable

  def create
    @like = @likeable.likes.new(user_id: current_user.id)
    @like.save
    redirect_to posts_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy

    redirect_to posts_path
  end

  private

  def find_likeable
    @likeable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @likeable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end
