class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: params[:comment][:body], user_id: current_user.id)
    if @comment.valid?
      redirect_to posts_url, notice: 'comment successfully posted!'
    else
      redirect_to posts_url, notice: "comments cannot be blank"
    end
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_url, notice: 'comment successfully deleted'
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    Comment.update(params[:id], :body => params[:comment][:body])
    redirect_to posts_url, notice: 'comment successfully updated'
  end
end
