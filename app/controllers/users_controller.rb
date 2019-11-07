class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
      flash.notice = "You have successfully signed up #{@user.username}"
    else @user.invalid?
      signup_error = @user.errors.messages.first.flatten.join(" ")
      redirect_to '/signup', alert: signup_error
    end

  end

  def show
    user_not_signed_in
    @user = User.find_by(id: params[:id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :lizard_species, :birthday, :profile_picture)
  end
end
