class UsersController < ApplicationController
  
  before_action :save_login_state, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    # if params[:commit] == 'create'
      @user = User.create(params.require(:user).permit(:username, :password))
      # session[:user_id] = @user.id
      redirect_to '/posts/index'
    # elsif params[:commit] == 'login'
    #   @user = User.find_by(username: params[:username])
    #   if @user && @user.authenticate(params[:password])
    #   else
    #     redirect_to '/'
    #   end
    # end
  end

  def show
    user = User.find_by(username: params[:username])
  end

  private

  def self.is_email(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end
end
