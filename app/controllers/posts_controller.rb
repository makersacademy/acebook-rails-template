class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    receiver = params.require(:post).permit(:receiver)[:receiver]
    @post = Post.create(content: post_params["content"], user_id: session[:user_id], receiver_id: receiver)
    redirect_back(fallback_location: root_path)
  end

  def index
    user_not_signed_in
    @post = Post.new
    @posts = Post.all
    @comments = Comment.all
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to_previous_page if edit_not_verify?
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_params)
    redirect_to_previous_page
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to_previous_page
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def update_params
    params.require(:post).permit(:content)
  end

  def redirect_to_previous_page
    redirect = session[:path] || '/posts'
    session[:path] = nil
    redirect_to redirect
  end

  def edit_not_verify?
    Time.now-@post.updated_at > 600 || session[:user_id] != @post.user_id
  end

end
