class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
	before_action :correct_user, only: [:destroy, :edit, :update]

	def new
    # @post = Post.new
		@post = current_user.posts.build
  end

  # Anna: I am not sure if we need it
  # def show 
  #   @post = Post.find(params[:id])
  # end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def create
    @post = Post.create(post_params)
		# @post = current_user.posts.build(post_params)
    redirect_to posts_url
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
      redirect_to posts_url
    else 
      render :edit
    end 
  end

	def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "Not authorised to edit this post" if @post.nil?
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
