class UsersController < ApplicationController
  # def show
  #   @user = User.find(params[:id])
  # end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
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
    @user = User.find_by(id: session[:user_id]) 
  end

  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email,
                                :password, :password_confirmation)

  end

end
