class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))

    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    authenticate_post
    time_limit_update
  end

  def update
    @post = Post.find(params[:id])
    authenticate_post
    time_limit_update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authenticate_post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Post was successfully destroyed." }
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def authenticate_post
    if current_user.id != @post.user_id
      flash.alert = "That is not your post"
      redirect_to root_path
    end
  end

  def time_limit_update
    if Time.now > @post.created_at + 10.minutes
      flash.alert = "You can no longer edit this post"
      redirect_to root_path
    end
  end


end
