class UsersController < ApplicationController
  def create
    begin
      @user = User.create(post_params)
      p "Hello"
      if @user.errors.messages[:email][0]
        flash[:returnMessage] = @user.errors.messages[:email][0]
      end

      if @user.errors.messages[:password][0]
        flash[:returnMessage] = @user.errors.messages[:password][0]
      end
      
      if @user.valid?
        flash[:returnMessage] = "User successfully registered"
      end
      
      rescue ActiveRecord::RecordNotUnique
        flash[:returnMessage] = "User already exists"
      rescue Exception
        flash[:returnMessage] = "Something horrible happened"
      end

    redirect_to root_url
  end
  def index
    @user = User.new
  end
  def post_params
    params.require(:user).permit(:email, :password)
  end
end
