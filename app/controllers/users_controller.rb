# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(
      animal: params[:user][:animal],
      age: params[:user][:age],
      owner: params[:user][:owner]
    )
    current_user.avatar = params[:user][:avatar]
    current_user.save!
    redirect_to user_path
    #     redirect_to :action => "show", :id => current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
