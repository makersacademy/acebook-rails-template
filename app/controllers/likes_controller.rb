class LikesController < ApplicationController

  before_action :find_post

 def create
  puts 'I am in the log'
  @post.likes.create
  redirect_to posts_url
 end

 def find_post
   @post = Post.find(params[:post_id])
 end

end
