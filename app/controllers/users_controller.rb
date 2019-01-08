class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
    p @user.id
    @posts = @user.posts.where("timeline_id = #{@user.id}").order(created_at: :desc)
    @allUsers = User.all.where("id != ?", current_user.id)
    @allUsers = @allUsers.order(first_name: :asc)
  end
end
