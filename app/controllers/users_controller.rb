class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # def create
  #   @user = User.create(params.require(:email).permit(:email, :password))
  #   redirect_to '/posts/index'
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You signed up successfully'
      flash[:color] = 'valid'
      session[:user_id] = @user.id
      redirect_to '/posts/index'
    else
      flash[:notice] = 'Form is invalid'
      flash[:color] = 'invalid'
      render 'new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
