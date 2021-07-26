class ProfileController < ApplicationController
  def index
     @current_user = current_user
  end



  def post_params
    params.inspect
    params.require(:user).permit(:image)
  end

  def edit
  end
end
