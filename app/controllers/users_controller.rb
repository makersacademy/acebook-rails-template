class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def new; 
    @user = User.new
  end

  def create
    user_params = params.require(:users).permit(:email, :password)
    @user = User.new(user_params)
    begin
      @user.save!
      session[:user] = @user
      redirect_to(posts_path, notice: 'Congratulations You Have Signed Up to AceBook')
    rescue StandardError => e
      puts e
      if e.message.include?('Email is invalid')
        notice = 'Email format invaild, please enter valid email'
      elsif e.message.include?('Email has already been taken')
        notice = 'Email already taken, please chose another'
      end
      redirect_to('/signup', notice: notice)
    end
  end
end
