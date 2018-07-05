class LikesController < ApplicationController

  # before_action :find_likeable

  def create
    puts current_user
    puts 'reached here'
    puts params
    @post = Post.find(params[:post_id])
    @post.liked_by @post.user # find at some point how to find the post for the current user
    redirect_to user_posts_path(@post.user)
  end
  #
  # def destroy
  #   @likeable.disliked_by current_user
  # end
  #
  # private
  # def find_likeable
  #   @likeable_type = params[:likeable_type].classify
  #   @likeable = @likeable_type.constantize.find(params[:likeable_id])
  # end

end
