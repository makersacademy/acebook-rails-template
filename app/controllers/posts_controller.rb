class PostsController < ApplicationController

  before_action :require_login, only: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    try_edit(@post)
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user[:id]
    @post.save
    
    redirect_to "/#{@post.wall_id}" if @post.wall_id
  end

  def update
    @post = Post.find(params[:id])
    redirect_to "/#{@post.wall_id}" if @post.update(post_params)
  end

  # def find_user(post_id)
  #   @this = Post.find_by_user_id(post_id).user_id
  #   @post_owner = User.find_by_id(@this)
  # end

  def delete
    @post = Post.find(params[:format])
    @wall_id = @post.wall_id
    @post.destroy
    redirect_to "/#{@wall_id}"
  end

  private

  def post_params
    params.require(:post).permit(:message, :wall_id)
  end

  def try_edit(post)
    if Time.now - @post.created_at > 600
      redirect_to "/#{@post.wall_id}", notice: "Cannot edit post after 10 minutes"
    else
      edit_post_path(post)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
