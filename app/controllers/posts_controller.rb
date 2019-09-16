class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  # def delete
  #
  #   redirect_to posts_url
  # end

  def index
    @posts = @current_user.posts.order('created_at DESC')
    @user = User.all
  end

  private
    def post_params
      params.require(:post).permit(:message)
    end
end
