class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to "/#{params[:post][:wall]}"
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def update
    @post.update_attributes(message: params[:post][:message])
    redirect_to "/#{@post.wall}"
  end

  def wall
    no_such_wall unless User.where(id: params[:wall]).count == 1
    @posts = Post.where(wall: params[:wall]).order(updated_at: :desc)
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
    { message: params.require(:post).require(:message),
      user_id: current_user.id,
      wall: params.require(:post).require(:wall)
    }
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
