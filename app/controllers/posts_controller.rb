class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/' + session[:wall_id]
  end

  def index
    session[:wall_id] = params[:user_id]
    @time = Time.new
    @posts = Post.where(wall_id: session[:wall_id]).reverse
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.message == post_params[:message]
      flash.now[:messages] = "Not possible. Message has not been changed"
      render :edit
    elsif Time.now - 10.minutes > @post.created_at
      redirect_to '/' + session[:wall_id]
    else
      @post.update_attributes(post_params)
      redirect_to '/' + session[:wall_id]
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to '/' + session[:wall_id]
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id).merge(wall_id: session[:wall_id])
  end

end
