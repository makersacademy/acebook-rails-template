class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @user_posts = Post.find_by(user_id: current_user.id)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to Acebook, fellow lizard"
      redirect_to :root
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
