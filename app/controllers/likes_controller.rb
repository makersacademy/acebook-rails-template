class LikesController < ApplicationController
  before_action :set_like

  def create
    if @like
      @like.update_attribute(:liked, true)
    else
      create_like(params)
    end
    redirect_to posts_url
  end

  def destroy
    if @like
      @like.update_attribute(:liked, false)
    end
    redirect_to posts_url
  end

  private

  def post_or_comment(params)
    if params[:comment_id]
      return Comment.find_by(id: params[:comment_id])
    else
      return Post.find_by(id: params[:post_id])
    end
  end

  def create_like(params)
    @parent_object = post_or_comment(params)
    @like = @parent_object.likes.build(user_id: current_user.id, liked: true)
    @like.save!
  end

  def set_like
    if params[:post_id]
      @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    else
      @like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    end
  end
end
