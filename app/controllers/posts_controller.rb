class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
