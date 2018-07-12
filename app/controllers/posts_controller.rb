class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    user = User.find(params[:user_id])
    @post = user.posts.create!(post_params)
    redirect_to user_posts_path(user)
  end

  def edit
  end

  def update
    user = User.find(params[:user_id])
   if @post.update_attributes(post_params)
     flash[:notice] = "Successfully updated post!"
     redirect_to user_posts_path(user)
   else
     flash[:alert] = "Error updating post!"
     render :edit
   end
  end

  def show
  end

  def destroy
    user = User.find(params[:user_id])
     if @post.destroy
       flash[:notice] = "Successfully deleted post!"
       redirect_to user_posts_path(user)
     else
       flash[:alert] = "Error updating post!"
     end
   end


  def likes
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
