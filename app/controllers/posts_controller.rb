class PostsController < ApplicationController
  def new
    return redirect_to root_path unless user_signed_in?
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to @post
  end

  def update
    find_post

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    find_post
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    find_post
  end

  def destroy
    find_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
