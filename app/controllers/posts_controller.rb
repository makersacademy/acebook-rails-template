class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create({"text"=>params[:post][:text], "poster_username"=> current_user.username, "recipient_username" => "NEED TO CHANGE"})
    redirect_back(fallback_location: root_path)
 
  end

  def index
    @posts = Post.all
  end

  def homepage

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end


end
