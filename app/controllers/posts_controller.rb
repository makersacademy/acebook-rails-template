class PostsController < ApplicationController
  before_action :require_login

  # def new
  # end

  def create
    message = post_params['message']
    user_id = current_user.id
    @post = Post.create(message: message, user_id: user_id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def edit
    @post = Post.find(params[:id])
    edit_timeout_error unless @post.can_edit?
  end

  def update
    @post = Post.find(params[:id])
    edit_timeout_error unless @post.can_edit?
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    else
      flash[:error] = "You don't own this post. Cannot be deleted."
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def edit_timeout_error
    flash[:error] = "Post's cannot be edited after 10mins!"
    redirect_to posts_path
  end
end
