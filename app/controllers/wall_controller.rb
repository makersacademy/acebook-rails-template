class WallController < ApplicationController
  before_action :find_user

  def show 
    @wall_id = params[:user_id]
  end

  def find_user
    @wall_owner = User.find_by(id: params[:user_id])
    redirect_to '/404' if @wall_owner.blank?
  end

  # def new
  #   @post = Post.new
  #   @wall_user_id = params[:wall_id]
  #   session[:return_to] ||= request.referer
  # end

  # def show
  #   @c_user = User.find(params[:user_id])
  #   @current_user_posts = Post.where({ user_id: @c_user.id })
  #   @current_user_posts = Post.where(user_id: @c_user.id, wall_id: nil)
  #     .or(Post.where(wall_id: @c_user.id))

  #   @other_user = params[:user_id].to_i != session[:user_id]

  #   session[:return_to] ||= request.referer
  # end

  # private 

  # def post_params
  #   # params.require(:post).permit(:message)
  #   { message: params[:post][:message], 
  #   user_id: session[:user_id], 
  #   wall_id: params[:post][:wall_id] }
  # end
end
