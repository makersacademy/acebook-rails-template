class WallsController < ApplicationController
  def show   
    # p params[:id]
    # session[:wall_id] = params[:id] || current_user.id
    # # binding.pry
    # p "before if"
    # if User.find_by(id: session[:wall_id]).nil?
    #   p "in if before redirect"
    #   redirect_to "/#{current_user.id}"
    #   p "in if after redirect"
    # end
    # p "after if"
    # @user = User.find_by(id: session[:wall_id]) # || User.find_by(id: current_user.id)
    # Wall.create(id: @user.id) if Wall.find_by(id: @user.id).nil?
    # @wall = Wall.find_by(id: @user.id)

    session[:wall_id] = params[:id]
    @user = User.find_by(id: params[:id])
    if @user == nil
      redirect_to "/#{current_user.id}"
    elsif Wall.find_by(id: params[:id]) == nil
      Wall.create(id: params[:id])
    end
    @wall = Wall.find_by(id: params[:id])

    @posts = if Post.find_by(wall_id: session[:wall_id]).nil?
               []
             else
               Post.where(wall_id: session[:wall_id])
             end
    # @posts = Wall.find_by(id: current_user.id)
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
