class MentorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @students = Student.all
  end

  def update
    student = Student.find_by(email: params[:mentor][:student_email])
    current_user.students << student
    current_user.save
  end

end
