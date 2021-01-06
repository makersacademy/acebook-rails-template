class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update]
  before_action :find_comment, only: [:edit, :update]

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      flash[:notice] = "You cannot edit someone else's post"
      redirect_to posts_url
    elsif Time.now - @comment.created_at > 600
      flash[:notice] = "Posts cannot be updated after 10 minutes"
      redirect_to posts_url
    end
  end

  # POST /comments
  # POST /comments.json

  def create
    @comment = Comment.create(comment_params) { |c| c.user_id = current_user.id }
    redirect_to posts_url
  end

  def update
      @comment = Comment.find(params[:id])
      if current_user.id == @comment.user_id
        if @comment.update(comment_params)
          redirect_to posts_url
        else
          render :edit_comment
        end
      else
        redirect_to posts_path
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_post
    @current_post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @current_post.comments.find(params[:id])
  end

    def comment_params
      params.require(:comment).permit(:post_id, :user_id)
    end
end
