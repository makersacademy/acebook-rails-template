class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    # render plain: params[:user][:email].inspect
    @user = User.new(user_params)

    begin
      if @user.save
        flash[:success] = 'You have signed up!'
        redirect_to '/login' and return
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:danger] = 'Email already exists!'
      render 'new' and return
    end

    render 'new'
  end

  def show
    @user = User.find(params[:id])
    render 'show'

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                :password, :password_confirmation)

  end

end
