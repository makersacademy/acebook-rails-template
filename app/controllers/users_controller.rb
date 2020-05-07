class UsersController < ApplicationController
  def new
  end

  def create
    p params
    @user = User.new(user_params)
    
    p @user.save
    p @user
    @this_user = User.find(@user.id)
    p @this_user
    render plain: @user.inspect
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
      p 'Hello!'
    end
end
