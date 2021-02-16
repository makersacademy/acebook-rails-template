class PostsController < ApplicationController
  # get /courses/:id/posts/new
  def new
    @post = Post.new
  end

  # post /courses/:course_id/posts
  def create
    @post = Post.create(post_params)
    redirect_back fallback_location: "/"
  end

  # get /courses/:id/posts
  def index
    @posts = Post.all
  end

  # get /courses/:course_id/posts/:id
  def show
  end

  private

  def post_params
    post_params = params.require(:post).permit(:course_id, :content)
    post_params[:course_id] ||= params[:course_id]
    return post_params
  end
end
