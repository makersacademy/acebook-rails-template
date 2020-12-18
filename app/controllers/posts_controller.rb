class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params) { |c| c.user_id = current_user.id }
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "You cannot edit someone else's post"
      redirect_to posts_url
    elsif Time.now - @post.created_at > 600
      flash[:notice] = "Posts cannot be updated after 10 minutes"
      redirect_to posts_url
    end
  end

  def update
      @post = Post.find(params[:id])
      if current_user.id == @post.user_id
        if @post.update(post_params)
          p ("in first conditional")
          redirect_to posts_url
        else
          p ("in second conditional")
          render :edit
        end
      else
        redirect_to posts_path
      end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
