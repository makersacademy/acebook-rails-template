class UsersController < ApplicationController
  def create
    begin
      @user = User.create(post_params)
    rescue ActiveRecord::RecordNotUnique
      flash[:returnMessage] = "User already exists"
      p "user already registered"
    rescue Exception
      flash[:returnMessage] = "Something horrible happened"
      p "Caught unexpected error" 
    end

    redirect_to root_url
  end
  def index
    p "index"
    p @user = User.new
  end
  def post_params
    params.require(:user).permit(:email, :password)
  end
end
