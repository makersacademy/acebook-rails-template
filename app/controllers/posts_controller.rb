class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post was successfully created!'
    else
      flash[:alert] = 'Please enter a valid post'
    end
    redirect_to posts_url
  end

  def index
    @post = current_user.posts.build
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_url && return unless @post.user_id == current_user.id
    @post.destroy
    flash[:notice] = 'Post was successfully deleted!'
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      @post.update_attributes(post_params)
      format.html { redirect_to(@post) }
      format.json { render json: { message:'Post was successfully edited!' } }
      format.json { respond_with_bip(@post) }
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
