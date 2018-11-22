class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      redirect_to posts_url, notice: "User was successfully created"
    else
      flash[:alert] = "Username and E-mail must be unique, please try again"
      render action: "new"
    end
  end

  private

  def post_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password )
  end

end
