class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #change line below once user login working to User.find_by:
    @user = User.create(username: "Natasha", email: "natasha@acebook.com", password: "bob")
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at)
  end
end
