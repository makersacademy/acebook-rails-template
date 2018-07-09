class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]
  before_action :logged_in_user, only: [:edit, :update]
  skip_before_action :require_login

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
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

  def edit
  end

  def update
    if @user.name != user_params[:name]
      @user.update_attributes(name: user_params[:name])
      @user.avatar.attach(user_params[:avatar].tempfile)
      flash[:success] = "Profile Updated"
      render :show
    else
      flash.now[:danger] = "Something went wrong"
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

end
