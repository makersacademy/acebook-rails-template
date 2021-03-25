class PostsController < ApplicationController
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params['id'])
  end

  def update
    post = Post.find_by(id: params['id'])
    post.update(message: params[:post])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
