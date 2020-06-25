class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @mentors = Mentor.all
  end
end

# @students = Student.where(mentor: current_user)
# 