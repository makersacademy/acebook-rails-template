class UsersController < ApplicationController
  
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where creator_id: @user.id
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(post_params)
      redirect_back(fallback_location: root_path)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:user).permit(:avatar, :user_name, :birthday, :occupation, :bio)
  end
end
