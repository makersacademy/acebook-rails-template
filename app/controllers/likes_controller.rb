class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create]
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:error] = "You can't like more than once"
    else
      like = @post.likes.build(like_params)
      like.user_name = current_user.name
      like.save
    end
    redirect_to posts_url
  end

  def destroy
    if !(already_liked?)
      flash[:error] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to posts_url
  end

  def already_liked?
    Like.where(user_name: current_user.name, post_id: params[:post_id]).exists?
  end

  private
  def like_params
    params.permit(:user_name, :post_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
  end

end
