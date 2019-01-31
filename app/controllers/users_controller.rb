class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
      if @user.save
        render 'users/profile'
      else
        render 'users/index'
      end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :birthday,
      :password,
      :gender,
      :email
    )
  end

end
