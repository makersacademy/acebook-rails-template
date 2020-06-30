class MentorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @students = Student.all
    @mentor.students.reload
    p "++++++++++++++++++++"
    students_connected = []
    @mentor.students.each {|student| students_connected << student[:email]}
    p students_connected
  end

  def update
    student = Student.find_by(email: params[:mentor][:student_email])
    current_user.students << student
    current_user.save
    redirect_to "/mentors/#{current_user.id}/dashboard"
  end
end
