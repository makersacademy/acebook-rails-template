class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.valid?
      redirect_to '/'
    else @user.invalid?
      signin_error = @user.errors.messages.first.flatten.join(" ")
      redirect_to '/signup', alert: signin_error
    end

  end

  def show
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :lizard_species, :birthday, :profile_picture)
  end
end
