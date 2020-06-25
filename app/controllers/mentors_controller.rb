class MentorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @mentors = Mentor.all
  end
end
