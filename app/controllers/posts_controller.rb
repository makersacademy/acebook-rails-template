class PostsController < ApplicationController
  # before_action :owned_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @recipient_id = session[:recipient_id]
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to "/#{session[:recipient_id]}"
  end

  def edit
    @post = Post.find(params[:id])
    owned_post(@post)
    time_out(@post)
  end

  def update
    @post = Post.find(params[:id])
    redirect_to "/#{session[:recipient_id]}" if @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    owned_post(@post)
    @post.destroy
    redirect_to "/#{session[:recipient_id]}"
  end

  def index
    session.delete(:recipient_id)
    @posts = Post.where(recipient_id: [nil, ""]).order('created_at DESC')
    @comments = Comment.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message, :recipient_id)
  end

  def owned_post(post)
    unless current_user.id == post.user_id
      flash[:alert] = "That post doesn't belong to you"
      redirect_to "/#{session[:recipient_id]}"
    end
  end

  def time_out(post)
    if (Time.now - post.created_at) > 600
      flash[:alert] = "Timed out - you cannot edit this post"
      redirect_to "/#{session[:recipient_id]}"
    end
  end
end
