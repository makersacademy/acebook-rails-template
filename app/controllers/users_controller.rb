class UsersController < ApplicationController

  def new
    @user = User.new
    # @userID = User.find_by(email: params[:email])
    # session[:user_id] = @userID.id
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    # If user does not meet the coniditions user.id will be nil
    if user.id != nil
      redirect_to '/sessions/new', notice: `Welcome #{user.fname} #{user.lname}`
    else
      redirect_to '/', notice: 'Email and/or password are/is not meeting the requirements'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end

end
