class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: current_user.id)
    redirect_to posts_path
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def update
    @post.update_attributes(message: post_params)
    redirect_to posts_url
  end

  def wall
    no_such_wall unless User.where(id: params[:wall]).count == 1
    @posts = Post.where(wall: params[:wall])
    @wall_owner = User.find(params[:wall])
  end

  def edit
  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
      successful_delete
    else
      failed_delete
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).require(:message)
  end

  def successful_delete
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def failed_delete
    respond_to do |format|
      format.html { redirect_to posts_url,
         notice: 'You do not have permission to delete this post.'
      }
      format.json { head :no_content }
    end
  end

  def no_such_wall
    respond_to do |format|
      format.html { redirect_to posts_url,
         notice: 'That user does not exist :('
      }
      format.json { head :no_content }
    end
  end
  # def update_params
  #   params.require(:updated_post).require(:message)
  # end

end
