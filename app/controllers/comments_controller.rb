class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
  @comment = Comment.find(params[:id])
end

  def create
    current_user = session[:user_id]
    post_id = params[:post_id]
    p "----------------------"
    p post_id
    p "----------------------"
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:text,:post_id, :user_id, :id)
  end
end
