class PostsController < ApplicationController

  before_action :authorize, except: :index
  skip_before_action :verify_authenticity_token

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def data
    @posts = Post.all
    render json: @posts.to_json
  end

  private

  def post_params
    params.permit(:message)
  end
end
