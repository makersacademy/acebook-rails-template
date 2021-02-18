class PostsController < ApplicationController
  before_action :this_post, only: [:show, :edit, :update, :destroy]
  
  # get /courses/:id/posts
  def index
    @posts = Post.where(course_id: params[:course_id]).order(:position)
  end
  
  # get /courses/:id/posts/new
  def new
    @course = Course.find(params[:course_id])
    @post = Post.new
  end

  # post /courses/:course_id/posts
  def create
    @post = Post.create(post_params)
    flash[:success] = "Created a new post!"
    redirect_to action: "index"
  end

  # get /courses/:course_id/posts/:id
  def show
  end

  # get courses/:course_id/posts/:id/edit 
  def edit
  end

  def update
    @post.update(post_params)
    flash[:success] = "Edited the post!"
    redirect_back fallback_location: "/"
  end

  private

  def this_post
    @post = Post.find(params[:id])
  end

  def post_params
    post_params = params.require(:post).permit(:course_id, :content)
    post_params[:course_id] ||= params[:course_id]
    return post_params
  end
end
