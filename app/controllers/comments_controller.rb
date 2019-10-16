class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(message: params["message"], post_id: params[:post_id], user_id: current_user.id, email: current_user.email)
    if @comment.save
      redirect_to posts_path
      flash[:notice] = "Comment Added!"
    else
      flash[:notice] = "Comment not saved!"
    end
  end

  def show

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:message)
    end
end
