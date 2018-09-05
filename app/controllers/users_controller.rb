class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = 'Yay! you are now signed up!'
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/posts'
    else
      flash[:error] = 'Sorry, username not available!'
      redirect_to '/login'
    end
  end

  def me
    # Need to validate user before going to this route
    @user = current_user
    @posts = Post.where('user_name' => current_user.name).order(created_at: :desc).all
  end

  def update_avatar
    @user = current_user
    @user.update_attributes(:avatar => params['/me'][:avatar])
    redirect_to '/me'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
