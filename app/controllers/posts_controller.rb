class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

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
    p 'this is the params'
    p post_params
    p "this is the session id"
    p session[:user_id]
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == 1 && (Time.now - @post.created_at < 10.minutes)

      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end

    else
      redirect_to posts_path

    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == 1 #session[:user_id]
    @post.destroy
    redirect_to posts_path
    end

  end

  private
  def post_params
    params.require(:post).permit(:message,:input_user_id)
  end
end
