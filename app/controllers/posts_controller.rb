class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.wall_id == nil
      @post.wall_id = current_user.id
    end
    @post.user_id = current_user.id

    # @post.wall_id = current_user.id
    'This is the create method'
    p @post.wall_id
    p @post
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end


  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id && (Time.now - @post.created_at < 10.minutes)

      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end

    else
      redirect_to posts_path
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == session[:user_id]
    @post.destroy
    redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:message,:user_id,:wall_id)
  end

end
