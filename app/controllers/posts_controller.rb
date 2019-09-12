class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if post_params[:message].length > 4000
      flash[:error] = "Your post is too long."
      redirect_to (new_post_path) and return
    end
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url

  end

  def index
    @posts = Post.order("created_at DESC")
  end

  def update

    if post_params[:message].length > 4000
      flash[:error] = "Your post is too long."
      redirect_to (edit_post_path) and return
    end
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id #checks if user owns post
      @post.update(post_params)
      #updates and changes the post
    else
      flash[:error] = "Cannot update post!"
      #redirects and produces flash error
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end


  # def guard_post_length
  #
  #   if post_params[:message].length > 4000
  #     flash[:error] = "Your post is too long."
  #     redirect_to (new_post_path) and return
  #   end
  #
  # end




  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:error] = "Calm down, you can only delete your own posts"
      redirect_to posts_url
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
