class PostsController < ApplicationController

  before_action :require_login, only: [:index, :show]

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    try_edit(@post)
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = session[:user_id]
    @post.save
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end

  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def find_user(post_id)
    @this = Post.find_by_user_id(post_id).user_id
    @post_owner = User.find_by_id(@this)
  end

  def delete
    @post = Post.find(params[:format])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def try_edit(post)
    if Time.now - @post.created_at > 600
      redirect_to '/posts', notice: "Cannot edit post after 10 minutes"
    else
      edit_post_path(post)
    end
  end

end
