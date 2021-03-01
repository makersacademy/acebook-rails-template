class PostsController < ApplicationController

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if (@post.save)
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to root_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/posts'
    else
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
