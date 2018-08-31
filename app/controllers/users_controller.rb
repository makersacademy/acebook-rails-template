class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "Yay! you are now signed up!"
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/posts/new'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
