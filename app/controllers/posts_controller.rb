class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to posts_url
    else
      redirect_to posts_url, notice: 'cannot submit an empty post'
    end 


#       if @post.valid?
#         redirect_to posts_url
#       else
#         flash[:alert] = "comment cannot be blank"
#       end

  end

  def index
    @posts = Post.all
    @post = Post.new
    # @names = Post.find_user(params[:user_id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.editable?
    Post.update(params[:id], :message => params[:post][:message])
    redirect_to posts_url
    else
      # we need to get rid of the following line
    redirect_to posts_url, notice: 'cant edit' 
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end

