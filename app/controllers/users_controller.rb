class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.valid?
      redirect_to '/'
    else @user.invalid?
      p @user.errors.messages.values.join(" ")
      # flash[:notice] = @user.errors.messages.first
      redirect_to '/signup', alert: @user.errors.messages.first.join(" ")
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :desired_attribute, :birthday, :profile_picture)
  end
end
