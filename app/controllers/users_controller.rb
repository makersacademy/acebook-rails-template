class UsersController < ApplicationController
  def user_posts
   @user = User.find(params[:id])
   @posts = @user.posts

   #render plain: {posts: @posts.inspect, user: @user.inspect}
  end
end
