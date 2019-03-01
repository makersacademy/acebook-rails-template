class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    Post.create({user_id: current_user.id, message: params[:post][:message]})
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @posts_with_users = Post.left_outer_joins(:user)
                        .select('posts.*', 'users.first_name', 'users.last_name')
   p @posts_with_users

  end


  def show
    @post = Post.find(params[:id])
  end

end
