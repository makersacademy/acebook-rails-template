class PostsController < ApplicationController
  # skip_before_action :login_required, :only => [:index]

  def new
    check_for_user
    @post = Post.new
  end

  def create
    check_for_user
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    check_for_user
    @posts = Post.all.order(created_at: :desc)
  end

  def posts_api
    @posts = Post.all.order(created_at: :desc).as_json()
    @posts_with_name_and_likes = @posts.each do |post| 
                       post[:user_name] = User.find(post["user_id"]).name 
                       post[:number_of_likes] = Like.where(post_id: post["id"]).length
                       p "hello im here"
                       p post[:number_of_likes]
                       
    end

    render json: @posts_with_name_and_likes

  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def check_for_user
    if session[:user] === nil
      redirect_to new_user_url
    end
  end
end
