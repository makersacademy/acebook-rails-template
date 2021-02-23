class PostsController < ApplicationController
  before_action :this_post, only: [:show, :edit, :update, :destroy]
  before_action :this_course
  before_action :is_subscribed
  
  # get /courses/:id/posts
  def index
    @posts = Post.with_rich_text_content.where(course_id: params[:course_id]).order(:position)
  end
  
  # get /courses/:id/posts/new
  def new
    @post = Post.new
  end

  # post /courses/:course_id/posts
  def create
    begin
      Post.create!(post_params)
    rescue => exception
      flash[:danger] = exception
    else
      flash[:success] = "Created a new post!"
    ensure
      redirect_to action: "index"
    end
  end

  # get /courses/:course_id/posts/:id
  def show
  end

  # get courses/:course_id/posts/:id/edit 
  def edit
  end

  # patch/put courses/:course_id/posts/:id 
  def update
    begin
      @post.update!(post_params)
    rescue => exception
      flash[:danger] = exception
      redirect_back fallback_location: "/"
    else
    flash[:success] = "Edited the post!"
    redirect_to course_post_url(@course, @post)
    end
  end

  # delete courses/:course_id/posts/:id
  def destroy
    begin
      @post.destroy!
    rescue => exception
      flash[:danger] = exception
      redirect_back fallback_location: "/"
    else 
      flash[:success] = "Deleted the post!"
      redirect_to action: "index"
    end
  end

  private

  def this_post
    @post = Post.with_rich_text_content_and_embeds.find(params[:id])
  end
  
  def this_course
    @course = Course.find(params[:course_id])
  end

  def is_subscribed
    @subscription = Subscription.find_by(course_id: params[:course_id], user_id: session[:user_id]) || Subscription.new()
    unless @subscription.valid? || @course.user_id == session[:user_id]
      flash[:warning] = "You need to be subscribed to view this content"
      redirect_to course_url(@course)
    end
  end

  def post_params
    post_params = params.require(:post).permit(:course_id, :title, :content)
    post_params[:course_id] ||= params[:course_id]
    return post_params
  end
end
