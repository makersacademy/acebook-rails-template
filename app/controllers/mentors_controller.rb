class MentorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.all
  end

  def show
    @mentor = Mentor.find(params[:id])
  end

end
