class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where("post_id = #{@post.id}").order(:created_at).reverse_order
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if !authenticated?
      redirect_to posts_url
      flash[:danger] = 'You can only update your own posts'
    end
    if !@post.editable?
      redirect_to posts_url
      flash[:danger] = 'This post is no longer editable'
    end
  end

  def create
    @post = Post.create(message: post_params["message"],
                        user_id: session[:user_id], recipient_id: post_params["recipient_id"])
    user = User.find_by(id: post_params["recipient_id"])
    redirect_to user_path(user)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
  
    if !authenticated?
      redirect_to posts_path
      flash[:danger] = 'You can only delete your own posts'
    else
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :recipient_id)
  end

  def path_params

  end

end
