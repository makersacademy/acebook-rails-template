class WallsController < ApplicationController
  def show   

    session[:wall_id] = params[:id]
    @user = User.find_by(id: params[:id])
    redirect_to "/#{current_user.id}" if @user.nil?
      
    @posts = Post.where(wall_id: session[:wall_id])
  end

  def create
    post = Post.new(post_params)
    post.update(user_id: current_user.id, wall_id: session[:wall_id])
    post.save!

    redirect_to "/#{session[:wall_id]}"
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
