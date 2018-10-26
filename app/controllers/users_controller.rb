class UsersController < ApplicationController
  def show
    @user = if params[:id]
              User.find(params[:id])
            else
              current_user
            end
  end
end
