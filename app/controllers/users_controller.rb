class UsersController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @user = User.find_by(id: params[:id])
  #   raise ActionController::RoutingError.new('Not Found') if @user.blank?
  #   @posts = @user.posts
  # end

  def show
    if (@user = User.find_by_id(params[:id])).present?
      @posts = Post.where(wall_id: params[:id])
    else
      content_not_found
    end
  end
end
