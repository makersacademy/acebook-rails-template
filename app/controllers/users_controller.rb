class UsersController < ApplicationController

  def show
    current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    @user.save
    p @user
    if @user.created_at
      p 'I got here /1/'
      flash[:notice] = 'Successfully created user account'
      redirect_to '/login'
    else
      p 'I got here /2/'
      flash[:danger] = 'Please check submitted information'
      redirect_to '/users/new'
    end
  end

  private

  def get_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end

end
