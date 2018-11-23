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
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    user_like = Like.find_by({ likeable: @post, user: current_user })

    if user_like
      user_like.destroy
    else
      Like.create(likeable: @post, user: current_user, like: params[:like])
    end

    respond_to do |format|
      format.html do
        redirect_to :back
      end
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
