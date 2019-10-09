class UsersController < ApplicationController
  def new
  end

  def create
    # render plain: params[:user][:email].inspect
    @user = User.new(user_params)

    if @user.save
      # handle a successful save
      redirect_to  '/'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                :password, :password_confirmation)

  end

end
