class ProfilePostsController < ApplicationController
  def new 
    @profile_posts = current_user.posts.build
  end 
end
