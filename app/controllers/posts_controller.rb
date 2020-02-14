# frozen_string_literal: true
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(params.require(:post).permit(:message))
          redirect_to action: :index
          flash[:notice] = 'post was updated.'
      else
          render 'edit'
      end
    end    

    def edit
        @post = Post.find(params[:id])
    end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:id])

  #   @post.update(post_params)
  #   redirect_to @post
  # end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def destroy
    Post.find(delete_params).destroy
    # @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :time)
  end

  def delete_params
    params.require(:id)
  end
end 