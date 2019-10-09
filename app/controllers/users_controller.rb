class UsersController < ApplicationController
  def create
    begin
      @user = User.create(post_params)
      if @user.errors.messages[:email][0]
        flash[:returnMessage] = @user.errors.messages[:email][0]
      end

      if @user.errors.messages[:password][0]
        flash[:returnMessage] = @user.errors.messages[:password][0]
      end

      if @user.valid?
        flash[:returnMessage] = "User successfully registered"
        redirect_to posts_url
      else
        redirect_to root_url
      end

      rescue ActiveRecord::RecordNotUnique
        flash[:returnMessage] = "User already exists"
        redirect_to root_url
      rescue Exception
        flash[:returnMessage] = "Something horrible happened"
        redirect_to root_url
      end

  end
  def index
    @user = User.new
  end
  def post_params
    params.require(:user).permit(:email, :password)
  end
end
