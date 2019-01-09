class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    @posts = PostsController.timelinePost(@user.id)
    @allUsers = User.all.where("id != ?", current_user.id)
    @allUsers = @allUsers.order(first_name: :asc)
=======
    @posts = Post.where("timeline_id = #{@user.timeline.id}")
    @users = User.all.where("id != ?", current_user.id).order(first_name: :asc)
>>>>>>> 94806bd055d76e8215f781d3a3db971f4d2dc28c
  end
end
