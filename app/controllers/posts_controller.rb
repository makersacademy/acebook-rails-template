class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(post_params)
    @post = current_user.posts.create(post_params) if current_user
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def edit  
    @post = Post.find(params[:id])
    validate_is_editable
    if current_user.id == @post.user_id
      @post.editable? == true
    else
      flash[:alert] = "You're not allowed to edit someone else's post..."
    end
  end

  def update
    @post = Post.find(params[:id])
    validate_is_editable == true
    @post.update(post_params) 
      redirect_to posts_url and return
      render 'edit'
  end

  def destroy
    # @post = Post.find(params[:id])
    # @post.delete
    # redirect_to posts_url
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.delete
      redirect_to posts_url 
    else
      flash[:alert] = "You're not allowed to delete someone else's post..."
      redirect_to posts_url 
    end
  end

  def like
    # grabbing the post
    @post = Post.all.find(params[:id])
    #creating a like with that post and the current user's id
    Like.create(user_id: current_user.id, post_id: @post.id)
    # redirecting them back to that post
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :id)
  end

  def validate_is_editable
    #if user = !@post.user
    # redirect_to posts_url, notice: 'Error: You can only edit your own post!'
    #elsif 
    if !@post.editable?
    redirect_to posts_url, notice: 'Oops, this post is older than 10 minutes'
    return 
    end
  end  
end
