class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)

    if(@post.save)
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if(@post.save)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.each { |comment| comment.destroy }
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
