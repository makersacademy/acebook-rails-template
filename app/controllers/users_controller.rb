# frozen_string_literal: true

class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    # render plain: params[:users].inspect
    @user = User.create(user_params)
    # @user.save
    if @user.valid?
      redirect_to @user
    else
      flash[:notice] = @user.errors.messages
      p flash[:notice]
      p @user.errors.messages
      redirect_to '/signup'
      p flash[:notice]


    end
  end

  private

  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
