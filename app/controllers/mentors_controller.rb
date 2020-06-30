class MentorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.all
  end

  def show
    @mentor = Mentor.find(params[:id])
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @students = Student.all
  end

  def update
    student = Student.find_by(email: params[:mentor][:student_email])
    p "----------------------"
    p "params are #{params}"
    current_user.students << student
    current_user.save
  end
end
