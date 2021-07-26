class ProfileController < ApplicationController
  def index
     @current_user = current_user
  end

  

  def post_params
    params.inspect
    params.require(:post).permit(:message, :image)
  end
end
