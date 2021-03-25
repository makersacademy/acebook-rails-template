class PostsController < ApplicationController
  def new
    print ("user id: "); puts(current_user.id)
    @user = current_user
    @post = Post.new
    puts(@post)
  end

  def create
    p (post_params)
    # p ('\n')
    # p (params)
    # p(current_user)
    # @post = Post.build(params[:message])
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params["id"])
  end

  def update
    puts(params)
    post = Post.find_by(id: params["id"])
    print("pose: "); puts(post)
    post.update(message: params[:post])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
