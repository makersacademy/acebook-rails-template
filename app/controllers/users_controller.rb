class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  # def index
  #   # @users = User.all
  #   @users = User.where('id != ?' , current_user.id).page(params[:page]).per(12)
  # end

  def create
    User.create(user_params)
    redirect_to current_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
