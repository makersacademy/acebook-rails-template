class PostsController < ApplicationController
  before_action :logged_in_user
  def new
    @post = Post.new
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

  def index
    @posts = Post.all
    # p @posts.last.comments.reverse[0..2]
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message, :author, :user_id)
  end

end
