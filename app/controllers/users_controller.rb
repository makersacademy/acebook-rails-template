class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:me]

  def new; end

  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        session[:user_id] = user.id
        session[:user_name] = user.name
        format.html { redirect_to '/posts', notice: 'Yay! you are now signed up!' }
      else
        format.html { redirect_to '/login', notice: 'Sorry, username not available!' }
      end
    end
  end

  def me
    @user = current_user
    @posts = Post.where('user_name' => current_user.name).order(created_at: :desc).all
  end

  def update_avatar
    @user = current_user
    @user.update_attributes(avatar: params['/me'][:avatar])
    redirect_to '/me'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end

  def authenticate_user!
    super
  end
end
