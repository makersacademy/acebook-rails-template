class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @user = current_user
      @user_posts = Post.all.select { |p| p.user_id == current_user.id }
    else
      flash[:not_signed_in] = "You must be signed in to view that page!"
      redirect_to :root
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to Acebook, fellow lizard"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
