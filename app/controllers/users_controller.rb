class UsersController < ApplicationController
  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      redirect_to new_user_url
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render 'show'
    else
      redirect_to posts_url
      # add flash error
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
