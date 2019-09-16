class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @user = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    puts @post
    @post.update
    redirect_to root_path
    #   if @post.update_attributes(post_params)
    #     redirect_to posts_url
    #   else
    #     render "edit"
    # end
  end
  private
    def post_params
      params.require(:post).permit(:message, :id)
    end
end
