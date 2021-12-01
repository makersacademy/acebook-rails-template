class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/posts#index', notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def index 
    if params[:search_by_user] != ""
      @user_searched = User.where("lower(first_name) = ?", params[:search_by_user].downcase)
    end 
  end 

  private

  def user_params
   params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation, :gender, :dob)
  end

end
