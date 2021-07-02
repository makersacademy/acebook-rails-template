class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :update_last_seen_at, if: -> { current_user && (current_user.last_seen_at.nil? || current_user.last_seen_at < 1.minute.ago) }

  def update_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @users = User.all
    @online_users = User.where("last_seen_at > ?", 1.minute.ago)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    
  end

  def like
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    render 'vote.js.erb'
  end 

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :author, :user_id, :image)
  end

end
