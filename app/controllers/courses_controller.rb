class CoursesController < ApplicationController
  before_action :this_course, only: [:show, :edit, :update, :destroy]
  
  # get /courses
  def index
    @courses = Course.joins("INNER JOIN users ON courses.user_id = users.id").select("users.username, courses.*")
  end

  # get /courses/new
  def new
    @course = Course.new
  end

  #post /courses
  def create
    course = Course.create(course_params)
    flash[:success] = "Created a new course!"
    redirect_to course_url(course)
  end

  # get /courses/:id
  def show
    @subscription = Subscription.find_by(course_id: params[:id], user_id: session[:user_id]) || Subscription.new()
  end

  # get courses/:id/edit 
  def edit
  end

  # put/patch courses/:id 
  def update
    @course.update(course_params)
    flash[:success] = "Edited the course!"
    redirect_back fallback_location: "/"
  end

  # delete courses/:id
  def destroy
    @course.destroy
    flash[:success] = "Deleted the course!"
    redirect_back fallback_location: "/"
  end

  private

  def this_course
    @course = Course.find(params[:id])
  end

  def course_params
    course_params = params.require(:course).permit(:user_id, :title)
    course_params[:user_id] ||= session[:user_id]
    return course_params
  end

end
