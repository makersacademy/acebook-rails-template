class UsersController < ApplicationController

 skip_before_action :require_login

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Acebook #{@user.name}!"
      redirect_to user_posts_url(@user)
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end 

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
