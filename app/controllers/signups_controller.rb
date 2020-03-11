class SignupsController < ApplicationController
  def new
    # @user = User.new
  end
  def create
    @user = User.create(user_params)
    # @signup.save
    render plain: user_params.inspect
    # render plain: @user.inspect
  end

  private

  def user_params
     params.require(:signup).permit(:email, :password)
  end
end
