class PostsController < ApplicationController
  def index
    @user = User.find(session[:user]['id'])
    #comment
  end

  def new
    @user = User.find(session[:user]['id'])
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    post_params[:user_id] = session[:user]['id']
    @post = User.find(session[:user]['id']).posts.create(post_params)
    @post.save
    redirect_to user_posts_path(session[:user]['id'])
  end

  def destroy
    @post = User.find(session[:user]['id']).posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(session[:user]['id'])
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
