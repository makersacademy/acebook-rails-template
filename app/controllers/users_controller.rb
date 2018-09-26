class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create
    redirect_to users_url
  end

  def index
    
  end

  
end


# private

# def user_params
#   params.require(:post).permit(:message)
# end