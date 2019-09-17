class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if post_params[:message].length > 4000
      flash[:error] = "Your post is too long."
      redirect_to (new_post_path) and return
    end
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.order("created_at DESC")
  end

  def update
    if post_params[:message].length > 4000
      flash[:error] = "Your post is too long."
      redirect_to (edit_post_path) and return
    end
    @post = Post.find(params[:id])
    if Time.now - @post.created_at > 600
      flash[:error] = "Cannot update post, time limit passed!"
    elsif @post.user_id == current_user.id #checks if user owns post
      @post.update(post_params)
      #updates and changes the post
    end

    if Time.now - @post.created_at > 600
      flash[:error] = "You can't edit your post after 10 mins foooool, gotta delete it mate"
    else
      flash[:error] = "Post updated!"
      #redirects and produces flash error
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:error] = "Calm down, you can only delete your own posts"
      redirect_to posts_url
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
