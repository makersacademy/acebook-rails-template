class ProfileController < ApplicationController
  def index
    @post = Post.new
    @_posts = Post.where(user_id: current_user.id)
    @posts = @_posts.reverse
  end
end
