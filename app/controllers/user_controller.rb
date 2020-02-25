class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by_email(params[:user][:email])
      redirect_to '/login', notice: "Already a user, please log in"
    elsif params[:user][:password].length < 6 || params[:user][:password].length > 10
      redirect_to '/signup', notice: "Password must be at least 6 characters and no more than 10"
    elsif params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/signup', notice: "Please confirm your password again"
  # elsif params[:user][:name].empty?
  #   redirect_to '/signup', notice: "Name field cannot be blank"
    elsif @user.save
      @user = User.find_by_email(params[:user][:email])
      session[:user_id] = @user.id
      redirect_to '/posts', notice: "Signed up!"
    # redirect_to "/wall/@user.name.downcase", notice: "Signed up!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
