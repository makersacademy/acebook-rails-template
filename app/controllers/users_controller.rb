class UsersController < ApplicationController
  skip_before_action :require_login

  def index
    @user = User.all
  end

  def new
    if session[:user]
      redirect_to(user_posts_path(user_id: session[:user]['id']), notice: 'You cannot signup while logged in')
    end
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.new(user_params)
    begin
      @user.save!
      session[:user] = @user
      redirect_to(user_posts_path(user_id: session[:user]['id']), notice: "Congratulations #{@user['email']}, You Have Signed Up to AceBook!")
    rescue StandardError => e
      if e.message.include?('Password')
        notice = 'Password length incorrect, please enter a password between 6 and 10 charaters'
      elsif e.message.include?('Email is invalid')
        notice = 'Email format invaild, please enter valid email'
      elsif e.message.include?('Email has already been taken')
        notice = 'Email already taken, please choose another'
      end
      redirect_to('/signup', notice: notice)
    end
  end
end


