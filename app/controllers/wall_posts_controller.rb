class WallPostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.friendly.find(params[:user_id])
    @wallpost = WallPost.new
  end

  def create
    @user = User.friendly.find(params[:user_id])
    @wallpost = @user.wall_posts.create(wallpost_params)
    redirect_to user_url(@user)
  end

  def destroy
    @user = User.friendly.find(params[:user_id])
    @wallpost = WallPost.find(params[:id])
    @wallpost.destroy
    redirect_to user_url(@user), notice: 'Your wall post has been deleted'
  end

  def edit
    @user = User.friendly.find(params[:user_id])
    @wallpost = WallPost.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:user_id])
    @wallpost = WallPost.find(params[:id])

    if @wallpost.update(wallpost_params)
      redirect_to user_url(@user)
    else
      flash[:alert] = 'Wallpost message cannot be empty'
      render 'edit'
    end
  end

  private

  def wallpost_params
    params.require(:wall_post).permit(:text, :sender_id)
  end
end
