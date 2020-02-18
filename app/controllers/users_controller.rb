class UsersController < ApplicationController
  skip_before_action :require_login

  def index
    @user = User.all
  end

  def new
    @user = User.new
    redirect_to(user_posts_path(user_id: session[:user_id]), notice: 'You cannot signup while logged in') if session[:user_id]
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.new(user_params)
    begin
      @user.save!
      session[:user_id] = @user.id
      redirect_to(posts_path, notice: "Congratulations #{@user['email']}, You Have Signed Up to AceBook!")
    rescue StandardError
      redirect_to('/signup', notice: @user.errors)
    end
  end
end
