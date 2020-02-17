class PostsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: params["post"]["message"], users_id: @current_user.id)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.created_at > 10.minute.ago
      if @post.update(post_params)
        redirect_to posts_url
      else
        render "edit"
      end
    else
      flash[:notice] = "You can only edit messages for a maximum of 10 minutes after creation."
      flash[:color] = "invalid"
      redirect_to posts_url
    end
  end
   
  def index
    # @current_user = session[:users_id]
    @posts = Post.order(created_at: :desc)
  end


def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_url
end

  private 

  def post_params
    params[:post].permit(:message, :users_id)
  end
end
