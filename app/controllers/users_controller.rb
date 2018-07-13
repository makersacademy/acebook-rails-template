# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    user_params
    @user.update_attributes(
      animal: user_params["animal"],
      age: user_params["age"],
      owner: user_params["owner"]
    )
    current_user.avatar = user_params["avatar"]
    current_user.save!
    redirect_to user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :animal, :age, :owner)
  end
end
