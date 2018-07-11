class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]
  before_action :current_user_loggedin, only: [:edit, :update]
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
    if @user.update_attributes(user_params)
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :biography)
    end

    def current_user_loggedin
      unless @user == @current_user
        flash[:danger] = "You cannot edit another person's profile"
        redirect_to user_posts_path(@user)
      end
    end
end
