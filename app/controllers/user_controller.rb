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
    @user = User.find(id)
    @posts = @user.posts
    render :file => '../views/timeline.html.erb'
  end

end
