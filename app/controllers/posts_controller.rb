class PostsController < ApplicationController
  def index
    location = params[:user_id] || 0
    @posts = Post.where(location_id_fk: location)
    @location = location
  end

  def new
    @post = @user.posts.new
    @location = params[:user_id]
  end

  def edit
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    if @post.nil?
      message = 'Not authorized to update this post'
    elsif @post.created_at + 600 < Time.zone.now
      message = 'Not authorized to update this post'
    end
    @location = params[:location]
    redirect_to(user_posts_path(user_id: @location), notice: message) if message
  end

  def create
    post_params = params.require(:post).permit(:post_content, :location_id_fk)
    post_params[:user_id] = session[:user_id]
    @post = User.find(session[:user_id]).posts.create(post_params)
    @post.save
    redirect_to user_posts_path(user_id: post_params[:location_id_fk])
  end

  def update
    post_params = params.require(:post).permit(:post_content)
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    message = 'Not authorized to update this post'
    if @post
      if @post.created_at + 600 > Time.zone.now
        message = 'Post was successfully updated'
        @post.update(post_params)
      end
    end
    redirect_to(user_posts_path(user_id: params[:post][:location_id_fk]), notice: message)
  end

  def destroy
    @post = Post.find_by(user_id: session[:user_id], id: params[:id])
    @location = Post.find(params[:id]).location_id_fk
    message = 'Not authorized to delete this post'
    if @post
      if @post.created_at + 600 > Time.zone.now
        message = 'Post deleted'
        @post.destroy
      end
    end
    redirect_to(user_posts_path(@location), notice: message)
  end
end
