class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
    @posts = PostsController.timelinePost(@user.id)
    @allUsers = User.all.where("id != ?", current_user.id)
    @allUsers = @allUsers.order(first_name: :asc)
  end
end
