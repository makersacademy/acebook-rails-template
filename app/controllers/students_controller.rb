class StudentController < ApplicationController
  def sign_in
    @users = User.all
  end
end
