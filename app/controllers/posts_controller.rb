class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    post_params[:user_id] = session[:user]['id']
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to(@post,
                      notice: 'Post was successfully updated.')
        end
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  do
          render xml: @post.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_content)
  end
end
