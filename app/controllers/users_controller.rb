# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def index
    current_user = User.find_by_id(session[:current_user_id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create(user = User.create(user_params))
    # render plain: params[:users].inspect
    @user = user
    # @user.save
    if @user.valid?
      redirect_to @user
    else
      @user.errors.full_messages.to_s
      render 'new'
    end

  end

  private

  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
