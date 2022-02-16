class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all.where(receiver_id: params[:id]).order("created_at DESC")
    @post = Post.new
  end

  def create
    User.create(user_params)
    redirect_to current_user_path
  end

  def edit
    @user = User.find(params[:id])
    # render template: => ('Edit registration', edit_user_registration_path)
    # edit_user_registration_path
  end

  def update
    current_user.update(user_params)
    redirect_to edit_user_registration_path
  end

  private
  def user_params
    params.require(:user).permit(:avatar,:name, :email, :id)
  end

  
end
