class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if (@user = User.find_by_id(params[:id])).present?
      @posts = Post.where(wall_id: params[:id])
    else
      content_not_found
    end
  end
end
