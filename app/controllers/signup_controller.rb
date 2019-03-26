class SignupController < ApplicationController
  def new
    @user = Signup.new

  end

  def create
    @user = Signup.create(signup_params)
    redirect posts_url
  end

  private

  def signup_params
    params.require(:signup).permit(:username)
  end
end
