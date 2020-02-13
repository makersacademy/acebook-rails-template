class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    redirect_to '/posts/index'
  end

  def show
    user = User.find_by(username: params[:username])
  end

  private

  def self.is_email(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end
end
