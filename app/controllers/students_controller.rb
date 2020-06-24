class StudentsController < ApplicationController
  def index
    @students = Student.where(mentor: current_user)
    render :index
  end
end
