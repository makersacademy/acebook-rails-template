class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def comment
    @posts = Post.all
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      if @post.save
        format.js
        format.html { redirect_to @post }
        format.json { render 'show', status: :created, location: @post}
      end
    end
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.image.attach(params[:post][:image])
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @comment = Comment.new
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save!
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
