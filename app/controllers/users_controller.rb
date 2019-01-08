class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where("timeline_id = #{@user.timeline_id}").order(created_at: :desc)
  end
end
