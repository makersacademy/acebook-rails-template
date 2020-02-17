class PostsController < ApplicationController
  def index
    @posts = if params[:user_id]
               User.find(params[:user_id]).posts
             else
               Post.all
             end
  end

  def new
    @user = User.find(session[:user]['id'])
    @post = @user.posts.new
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    post_params[:user_id] = session[:user_id]
    @post = User.find(session[:user_id]).posts.create(post_params)
    @post.save
    redirect_to user_posts_path(session[:user_id])
  end

  def destroy
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    if @post
      message = 'Post deleted'
      @post.destroy
    else
      message = 'Not authorized to delete this post'
    end
    redirect_to(user_posts_path(session[:user_id]), notice: message)
  end

  def edit
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    redirect_to(user_posts_path(session[:user_id]), notice: 'Not authorized to update this post') unless @post
  end

  def update
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    if @post
      message = 'Post was successfully updated'
      @post.update(post_params)
    else
      message = 'Not authorized to update this post'
    end
    redirect_to(@post, notice: message)
  end

  private

  def post_params
    params.require(:post).permit(:post_content)
  end
end
