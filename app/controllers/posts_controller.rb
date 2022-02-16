class PostsController < ApplicationController
  # before_action authenticate_user
  
  def new
    @post = Post.new
  end

  def create
    # @post = Post.create(post_params)
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def edit 
    @post = Post.find(params[:id])
    validate_is_editable
  end

  def update
    @post = Post.find(params[:id])
   validate_is_editable == true
    @post.update(post_params) 
      redirect_to posts_url and return
      render 'edit'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
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

    # if Post.persisted? && !Post.editable?
    #   @post.errors[:editable] << "can edit in just 10 minutes after creation"
    # end

  
end
