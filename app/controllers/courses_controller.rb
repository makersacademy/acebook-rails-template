class CoursesController < ApplicationController
  
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
    @course = Course.find(params[:id])
  end

  private

  def course_params
    course_params = params.require(:course).permit(:user_id, :title)
    course_params[:user_id] ||= session[:user_id]
    return course_params
  end

end
