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
        format.html { redirect_to posts_url }
        format.json { render 'show', status: :created, location: @post }
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

  # def like
  #   @post = Post.find(params[:id])
  #   @post.likes += 1
  #   @post.save!
  #   respond_to do |format|
  #     if @post.save
  #       format.js
  #       format.html { redirect_to posts_url }
  #       format.json { head :no_content }
  #     end
  #   end
  # end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      if @post.destroy
        format.js
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
