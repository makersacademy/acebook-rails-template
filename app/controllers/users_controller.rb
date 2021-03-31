class UsersController < ApplicationController
  def new
    redirect_to posts_url if signed_in?
    @user = User.new
  end

  def show
    not_signed_in_redirect
    @user = current_user
    @user_posts = Post.all.select { |p| p.user_id == current_user.id }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to Acebook, fellow lizard"
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
