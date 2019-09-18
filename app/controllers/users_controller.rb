# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def wall
    @posts = current_user.posts.all
    @albums = %w[1 2 3]
  end

  def update
    p params
    current_user.avatar.attach(params[:user][:avatar])
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def create
    @user = user_from_params
    if @user.password.length < 6
      flash[:notice] = 'Password needs to be over 6 characters'
      redirect_to sign_up_url
      return
    end
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
