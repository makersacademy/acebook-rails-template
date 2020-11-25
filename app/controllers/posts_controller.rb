require_relative '../helpers/posts_helper.rb'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post
      render json: {
        status: :created,
        post: @post
      }
    else
      render json: {
        status: :unprocessable_entity
      }
    end
  end

  def index
    @posts = Post.all.reverse
    if @posts
      render json: {
        posts: @posts
      }
    else
      render json: {
        status: 404
      }
    end
  end

  def like
    like_post(params)
    @post = Post.find_by(id: params['post']['id'])

    if @post
      render json: {
        status: :like_created,
        post: @post,
        like_count: @post.likes.size
      }
    else
      render json: {
        status: :unprocessable_entity
      }
    end
  end
  
  def comment
    comment_on_post(params)
    @commented_post = Post.find_by(id: post_params[:post_id])

    if @commented_post
      render json: {
        status: :comment_created,
        post: @commented_post
      }
    else
      render json: {
        status: :unprocessable_entity
      }
    end
  end

  private

  def post_params
    params.require(:post).permit(:id, :message, :user_id)
  end

  def like_post(liked_post_params)
    @post = Post.find_by(id: liked_post_params['post']['id'])
    @user = User.find_by(id: liked_post_params['post']['user_id'])
    @post.like(@user)
  end

  def comment_on_post(post_params)
    @user = User.find_by(id: session[:user]["id"])
    @post = Post.find_by(id: post_params[:post_id])
    @post.comment(@user, post_params[:comment_text])
  end

end
