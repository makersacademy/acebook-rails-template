class PostsController < ApplicationController

  before_action :redirect_if_user_is_not_signed_in

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.sortedbymostrecent
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id === current_user.id
      @post.destroy
      flash[:notice] = "Your post has been deleted"
    elsif @post.user_id != current_user.id
      flash[:error] = "You cannot delete other people's posts"
    end
    redirect_to posts_url
  end

  def edit
    if Post.find(params[:id]).update_valid?
      @post = Post.find(params[:id])
      if @post.user_id != current_user.id
        flash[:error] = "You cannot update other people's posts"
        redirect_to posts_url
      end
    else
      # the message below would only appear if the user tries to update from url instead of from button
      flash[:error] = "You cannot update this post"
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id === current_user.id
      @post.update(post_params)
      flash[:notice] = "Your post has been updated"
    elsif @post.user_id != current_user.id
      flash[:error] = "You cannot update other people's posts"
    end
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
