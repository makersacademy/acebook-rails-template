class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # puts post_params['message'].encode('utf-8')
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    # redirect_to edit_post_url
  end

  def update
    a = params[:id]
    @post = Post.find_by(id: a)
    @post.update(post_params)
    redirect_to posts_url
  end

  def show
    a = params[:id]
    @post = Post.find_by(id: a)
    if time_difference
      then @post.destroy
    else
      flash[:notice] = 'You were too late! Delete faster (10 mins limit)!'
    end
    redirect_to posts_url
  end

  private

  def time_difference
    Time.now - @post.created_at <= 600
  end


  def post_params
    params.require(:post).permit(:message)
  end
end
