class PostsController < ApplicationController
# before_action :authenticate_user!, except: [:index, :show]
before_action :find_post, only: [:edit, :destroy, :show, :update]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def index_by_user

  end

  def edit

  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def show

  end

  def update
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
