class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/' + session[:wall_id]
  end

  def index
    p "current user id " + current_user.id.to_s
    p "Wall id " + params[:user_id].to_s
    session[:wall_id] = params[:user_id]
    @time = Time.new
    #@posts = Post.all.reverse
    @posts = Post.where(wall_id: session[:wall_id]).reverse

    # User.where(weekly_subscriber: true).find_each do |user|
    #   NewsMailer.weekly(user).deliver_now
    # end
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
