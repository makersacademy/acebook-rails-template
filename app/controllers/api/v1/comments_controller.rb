# frozen_string_literal: true

# API comments controller
class Api
  # class v1
  class V1
    # class comments controller
    class CommentsController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        render json: post
      end

      private

      def comment_params
        params.require(:comment).permit(:message, :user_id)
      end
    end
  end
end
