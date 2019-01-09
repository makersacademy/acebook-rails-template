class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
    @posts = Post.where("timeline_id = #{@user.timeline.id}")
    @users = User.all.where("id != ?", current_user.id).order(first_name: :asc)
  end
end
