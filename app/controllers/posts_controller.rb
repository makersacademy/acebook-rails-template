# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :correct_user,   only: %i[destroy edit]
  include Response

  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to root_url
    end
  end

  def show
    render 'index'
  end

  def edit
    @post = Post.where('id = ? and created_at >= ?', params[:id], 10.minutes.ago).first
    if @post.nil?
      flash[:danger] = "You can't edit a post created more than 10mins ago"
      redirect_to posts_url
    else
      @post
    end
  end

  def create
    if logged_in?
      @user = User.find(session[:user_id])
      @post = @user.posts.create(post_params)
      @post.update_attributes(wall_id: session[:wall_id])
      redirect_to request.referrer
    else
      flash[:danger] = 'You must be logged in to create a post!'
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      if session[:wall_id] == 0
        redirect_to '/posts'
      else
        redirect_to "/users/#{session[:wall_id]}"
      end
    else
      render 'edit'
    end
  end

  def index
    if logged_in?
      @post = Post.new
      session[:wall_id] = 0
      @public_posts = Post.where('wall_id = 0').order(created_at: :desc)
    else
      redirect_to root_url
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to request.referrer || root_url
  end

  def post_api
    @posts = Post.find_by_sql("SELECT posts.*, users.username
                               FROM posts INNER JOIN users
                               ON posts.user_id = users.id")
    logger.debug @posts
    json_response(@posts)
  end

  private

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      flash[:danger] = "This isn't your post!"
      redirect_to '/posts'
    end
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
