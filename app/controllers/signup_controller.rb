class SignupController < ApplicationController
  
  def create
    @user = Signup.create(signup_params)
    redirect posts_url
  end

  def index
    @user = Signup.new
  end

  private

  def signup_params
    params.require(:signup).permit(:username)
  end


end
