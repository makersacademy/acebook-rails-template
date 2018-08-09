# frozen_string_literal: true

# Posts controller, and methods.
class Api
  # class version 1
  class V1
    # class posts controller
    class PostsController < ApplicationController
      def new
        @post = Post.new
      end

      def show
        @posts = Post.find(params[:id])
      end

      def create
        @user = User.find(current_user.id)
        @post = @user.posts.create(post_params)
        render json: post
      end

      def index
        render json: Post.all
        @username = current_user.username
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        render json: post if @post.update_attributes(post_params)
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
      end

      private

      def post_params
        params.require(:post).permit(:message, :created_at)
      end
    end
  end
end
