class PostsController < ApplicationController
  def new
    @post = Post.new
    @wall_id = params[:user_id]
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id, wall_id: params[:wall_id]))
    @wall_id = params[:wall_id]
    redirect_home
  end

  def delete
    @post = Post.find(params[:format])
    @wall_id = @post.wall_id
    @post.delete
    redirect_home
  end

  def index
    @user_class = User
    @posts = Post.all.order("created_at DESC")
    if @posts.first == nil
      @wall_posts = @posts
    else
      @wall_posts = @posts.select { |post| post.wall_id == "" }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @wall_id = @post.wall_id
    if @post.update(params[:post].permit(:message))
      redirect_home
    end
  end

  private
    def post_params
      params.require(:post).permit(:message)
    end

    def redirect_home
      if @wall_id == ""
        redirect_to posts_url
      else
        redirect_to user_url(@wall_id)
      end
    end
end
