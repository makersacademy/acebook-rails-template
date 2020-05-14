class Api::V1::PostsController < ApplicationController

  before_action :set_post, only:[:show, :update, :destroy]


#  def new
#    @post = Post.new
#  end

#  def edit
#    @post = Post.find(params[:id])
#  end

  def create
    @post = Post.create(post_params)
    if @post.save
      render json: @post, location: api_v1_post_url(@post)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @posts
    else
      render json: @post.errors, status: :unprocessable_entry
    end
  end

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end
  
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:message)
  end
end
