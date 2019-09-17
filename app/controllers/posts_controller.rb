# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
    # @maximum_length = Post.validators_on( :message ).first.options[:maximum]
  end

  def create
    # if current_user
      if post_params[:message].length > 4000
        flash[:error] = "Your post is too long."
        redirect_to (new_post_path) and return
      end
      Post.create(post_params)
      @post = current_user.posts.create(post_params)
    # end

    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @user_id_from_post = @post.user_id
    if @user_id_from_post != current_user.id
      redirect_to posts_path, notice: 'Thats not your post!'
    else
      @post = Post.find(params[:id])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post =  Post.find(params[:id])
    @user_id_from_post = @post.user_id
    if @user_id_from_post != current_user.id
      redirect_to posts_path, notice: 'Thats not your post!'
    else
      @post = current_user.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user_id_from_post = @post.user_id
    if @user_id_from_post != current_user.id
      redirect_to posts_path, notice: 'Thats not your post!'
    else
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
