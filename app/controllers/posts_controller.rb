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
    @post = Post.find_by(id: params['post']['id'])
    if @post
      like_post(params)
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
    comment_on_post(comment_params)
    @commented_post = Post.find_by(id: comment_params['post_id'])
    if @commented_post
      render json: {
        status: :created,
        post: @commented_post,
        comments: @commented_post.comments.reverse
      }
    else
      render json: {
        status: :unprocessable_entity
      }
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id, :id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :comment_text, :user_id)
  end

  def like_post(liked_post_params)
    @post = Post.find_by(id: liked_post_params['post']['id'])
    @user = User.find_by(id: liked_post_params['post']['user_id'])
    @post.like(@user)
  end

  def comment_on_post(given_comment_params)
    @user = User.find_by(id: given_comment_params["user_id"])
    @post = Post.find_by(id: given_comment_params["post_id"])
    @post.comment(@user, given_comment_params["comment_text"])
  end

end
