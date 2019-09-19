class PostsController < ApplicationController
  before_action :require_login

  def new
    session[:return_to] = request.referer
  end

  def create
    message = post_params['message']
    user_id = current_user.id
    wall_id = User.find(session[:host_user_id]).wall.id
    @post = Post.create(message: message, user_id: user_id, wall_id: wall_id)
    # redirect_to posts_url
    redirect_to session.delete(:return_to)
  end

  def index
    session[:host_user_id] = current_user.id
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def edit
    session[:return_to] = request.referer
    @post = Post.find(params[:id])
    edit_timeout_error unless @post.can_edit?
  end

  def update
    @post = Post.find(params[:id])
    edit_timeout_error unless @post.can_edit?
    @post.update(post_params)
    # redirect_to posts_path
    redirect_to session.delete(:return_to)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    else
      flash[:error] = "You don't own this post. Cannot be deleted."
    end
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def edit_timeout_error
    flash[:error] = "Post's cannot be edited after 10mins!"
    redirect_to request.referer
  end
end
