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
    # redirect_to edit_user_path(current_user)
    # render(:devise => 'registrations/edit')
  end

  def update
    current_user.update(user_params)
    redirect_to edit_user_registration_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :id)
  end

  
end
