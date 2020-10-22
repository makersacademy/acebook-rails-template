class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])

    if current_user[:id] != @post[:user_id]
      redirect_to root_path
    end

    # add check for post time
  end

  def update
    @post = Post.find(params[:id])

    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to root_path
      else
        render 'edit'
      end
    else 
      redirect_to root_path, :status => 403
    end
  end 
  
  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def update_post_params
    params.require(:post).permit(:message)
  end
end
