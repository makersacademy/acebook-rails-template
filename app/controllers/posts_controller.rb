class PostsController < ApplicationController
  before_action :post_owner, only: [:edit, :update, :destroy]
  before_action :post_time, only: [:edit, :update]
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def post_owner
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path, :alert => "This is not your post to edit"
    end
  end

  def post_time
    if Time.now > (@post.created_at + 10*60)
      redirect_to posts_path, :alert => "You can no longer edit this post (it is more than 10 minutes old)"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id]).destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
