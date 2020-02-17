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
    post_params[:user_id] = session[:user]['id']
    @post = User.find(session[:user]['id']).posts.create(post_params)
    @post.save
    redirect_to user_posts_path(session[:user]['id'])
  end

  def destroy
    @post = Post.find_by(user_id: session[:user]['id'], id: params[:id])
    if @post
      message = "Post deleted"
      @post.destroy
    else
      message = "Not authorized to delete this post"
    end
    redirect_to(user_posts_path(session[:user]['id']), notice: message)
  end

  def edit
    @user = User.find(session[:user]['id'])
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(@post, notice: 'Post was successfully updated.')
  end

  private

  def post_params
    params.require(:post).permit(:post_content)
  end
end
