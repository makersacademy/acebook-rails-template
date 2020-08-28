class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :destroy] 

  # def revert_url
  #   unless params[:user_id] == session[:user_id]
  #     redirect_to action: 'show', id: session[:user_id]
  #   end
  # end

  def index
    redirect_to '/'
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Acebook!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
