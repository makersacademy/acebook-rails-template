class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to "/", notice: t(".notice")
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:current_user_id])
    @posts = Post.where(user_id: @user.id)
  end


  def index
    if logged_in?
      @user = User.find(session[:current_user_id])
      @post = Post.new
      @posts = Post.all
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def logged_in?
    !session[:current_user_id].nil?
  end

end
