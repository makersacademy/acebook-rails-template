class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if params[:post][:message].length > 0
     @post = current_user.posts.create(post_params)
    else 
      flash[:notice] = "The post can't be empty"
    end
    redirect_to posts_url

  end

  def index
    @posts = Post.all.reverse_order
    @comments = Comment.all
    @comment = Comment.new( :post => @post )
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    #raise params.inspect
    @post = Post.find(params[:id])
    @post.update(message: params[:post][:message])
    redirect_to posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(@post)
    flash[:notice] = "The post has been deleted."
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :photo)
  end
end
