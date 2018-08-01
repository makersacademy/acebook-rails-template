class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:current_user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show

    @user = User.find(session[:current_user_id])
    # @post = Post.all
  end

  def update
    # p params
    @post = Post.create(post_params2)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def post_params2
    params.require(:post).permit(:user_id, :message)
  end

end
