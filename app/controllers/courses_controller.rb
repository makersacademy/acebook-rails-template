class CoursesController < ApplicationController
  
  # get /courses
  def index
    @courses = Course.all
  end

  # get /courses/new
  def new
    @course = Course.new
  end

  #post /courses
  def create
    Course.create(course_params)
    redirect_back fallback_location: "/"
  end

  private

  def course_params
    course_params = params.require(:course).permit(:user_id, :title)
    course_params[:user_id] ||= session[:user_id]
    return course_params
  end

end
