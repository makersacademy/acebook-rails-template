class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if post_params[:message].length > 4000
      flash[:error] = 'Your post is too long.'
      redirect_to(new_post_path) && return
    end
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.where(to_user_id: nil).order('created_at DESC')
  end

  def update
    if post_params[:message].length > 4000
      flash[:error] = 'Your post is too long.'
      redirect_to(edit_post_path) && return
    end
    @post = Post.find(params[:id])
    if Time.now - @post.created_at > 600
      flash[:error] = 'Cannot update post, time limit passed!'
    elsif @post.user_id == current_user.id # checks if user owns post
      @post.update(post_params)
      # updates and changes the post
    end

    if Time.now - @post.created_at > 600
      flash[:error] = "You can't edit your post after 10 mins foooool, gotta delete it mate"
    else
      flash[:error] = 'Post updated!'
      # redirects and produces flash error
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:error] = 'Calm down, you can only delete your own posts'
      redirect_to posts_url
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  def wall_create
    # POST /users/:user_is/posts
    if wall_post_params[:message].length > 4000
      flash[:error] = 'Your post is too long.'
      redirect_to(user_posts_path) && return
    end

    Post.create(wall_post_params)

    redirect_to(user_path(params[:user_id]))
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def wall_post_params
    wpp = params.require(:post).permit(:message, :user_id, :to_user_id)
    wpp[:user_id] = current_user.id
    wpp[:to_user_id] = params[:user_id]
    wpp
  end
end
