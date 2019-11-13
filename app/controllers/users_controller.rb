class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if (@user = User.find_by_id(params[:id])).present?
      @posts = Post.where(wall_id: params[:id])
    else
      content_not_found
    end
  end
  private
  def user_params
    params.require(:user).permit(:avatar, :username)
  end
end
