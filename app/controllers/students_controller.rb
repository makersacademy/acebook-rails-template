class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.all
  end
end

# @students = Student.where(mentor: current_user)
# 