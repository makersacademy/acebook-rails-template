class SignupsController < ApplicationController
  def new
  end
  def create
    # @user = Signup.new(params[:signup])
    render plain: params[:signup].inspect
    # render plain: @user.inspect
  end
end
