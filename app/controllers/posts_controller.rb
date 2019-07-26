class PostsController < ApplicationController

  def index    
    @posts = Post.all.order('created_at DESC')
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
    @post = Post.create(post_params)

    if @post.save
      redirect_to [current_user, @post]
    else
      render 'new'
    end
    
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(:message => (params[:post][:message]))
      redirect_to [current_user, @post]
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
