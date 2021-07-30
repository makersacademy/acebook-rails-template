class ProfileController < ApplicationController
  def index
    @current_user = current_user
  end

  def post_params
    params.require(:user).permit(:avatar)
  end

  def edit
  end
end
