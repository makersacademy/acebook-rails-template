require_relative '../models/post.rb'
class UserController < ApplicationController

  def user
    if current_user == nil
      redirect_to '/'
    else
      get_posts_by_id(params[:id])
    end
  end

  def get_posts_by_id(id)
    begin
      @user = User.find(id)
      @posts ||= @user.posts
      render :file => '../views/timeline.html.erb'
    rescue
      begin
        @user = User.find_by(username: id)
        @posts ||= @user.posts
        render :file => '../views/timeline.html.erb'
      rescue
        redirect_to '/errors/invalid-user-id'
      end
    end
  end
end
