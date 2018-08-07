class LikesController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @like = Like.create(like_params)
    @like.save

    # @like_count = Like.count(:conditions => "post_id" == 2)
    # p @like_count
    redirect_to user_path(@user)
  end

  # def addLike
  #   @post.increment_counter(:post_count, @post.id)
  # end

  private

  def like_params
    { user_id: session[:current_user_id], post_id: params[:post_id] }
  end

end
