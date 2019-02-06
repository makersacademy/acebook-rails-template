class PostsController < ApplicationController
  before_action :require_login
  
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.wall_id = session[:current_wall]
    if @post.save
      @user = current_user
      redirect_to user_path(session[:current_wall]), notice: "Logged in
       as #{@user.email}. Your post has been created!"
    else
      redirect_to '/posts#new', notice: "Your new post couldn't be created!"
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @user = current_user
      redirect_to user_path(session[:current_wall]), notice: "Logged in
       as #{@user.email}. Post updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = current_user
    redirect_to user_path(session[:current_wall]), notice: "Logged in as
     #{@user.email}. Post deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
