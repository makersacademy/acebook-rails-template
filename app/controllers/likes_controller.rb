class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if (@post.find_like(current_user))
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
    # redirect_to posts_path
  end

  def destroy
    if !(@post.find_like(current_user))
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end


  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

end
