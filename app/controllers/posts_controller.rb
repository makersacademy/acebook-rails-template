class PostsController < ApplicationController
  before_action :find_post, only: [:update, :edit]
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    @post.wall_user_id = session[:wall_user_id]
    if @post.save
      redirect_to wall_path(session[:wall_user_id])
    else
      flash.now[:notice] = "Error saving your new note, please try again!"
      redirect_to wall_path(session[:wall_user_id])
    end
  end

  def edit
    if !@post.can_edit(@post.id, current_user.id)
      flash[:alert] = "Sorry, you can't edit this post!"
      redirect_to :action => 'index'
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to :action => 'index'
    else
      flash.now[:notice] = "Error updating your post. Please try again!"
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Your post was deleted!'
  end

  def index
    @posts = Post.all.where(wall_user_id: current_user.id).order("updated_at DESC")
    @post = Post.new
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :wall_user_id)
  end
end
