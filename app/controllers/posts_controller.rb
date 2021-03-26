class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    puts(@post)
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by(id: params['id'])
  end

  def update
    puts(params)
    post = Post.find_by(id: params['id'])
    print('pose: '); puts(post)
    post.update(message: params[:post])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
