class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    # If user does not meet the conditions user.id will be nil
    if user.save
      redirect_to '/sessions/new', notice: `Welcome #{user.fname} #{user.lname}`
    else
      redirect_to '/', notice: 'Email and/or password are/is not meeting the requirements'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end

end
