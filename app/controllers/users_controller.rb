class UsersController < ApplicationController

  # before_action :authenticate_user!


  def index
    authenticate_user
  end

  private

  def authenticate_user
    if !user_signed_in?
      redirect_to '/'
    end
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.create(post_params)
  #   redirect_to users_url
  # end

  # def index
  #   @users = User.all
  #   @current_user = @users.last
  # end

  # private

  # def post_params
  #   params.require(:user).permit(:username)
  # end

end
