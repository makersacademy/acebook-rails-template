class CommentsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])

    @comment = Comment.create(
      user_id: session[:user_id],
      post_id: params[:post_id],
      body: params[:comment_body]
    )
    
    redirect_to posts_url
  end
end
