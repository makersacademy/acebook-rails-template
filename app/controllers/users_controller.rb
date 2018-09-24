class UsersController < ApplicationController
  def create
    render plain: params[:user].inspect
    redirect_to 'users/sign_up'
  end
end
