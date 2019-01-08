class PostsController < ApplicationController

  # def new
  #   @post = Post.new 
  #   # page not in use, reach with "render 'new'"
  # end
 
  def edit
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def create
    @post = Post.new(post_params.merge(creator_id: current_user.id))
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Post can not be empty, please enter information."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_back(fallback_location: root_path)
  end

  private
  def post_params
    params.require(:post).permit(:description)
  end

end
