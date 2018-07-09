class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]
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
    # avatar = params[:user][:avatar]
    if @user.update(user_params)
      if avatar
        @user.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images")), content_type: "image/jpg")
        flash[:success] = "Profile Updated"
        redirect_to @user
      else
        flash.now[:danger] = "Something went wrong"
        render :edit
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
