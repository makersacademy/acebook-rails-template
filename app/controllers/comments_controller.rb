class CommentsController < ApplicationController
  def create
    post = Post.find(comment_params[:post_id])
    content = params[:comment][:content]
    @comment = post.comments.build(content: content, user: current_user)
    # @comment.save
    # redirect_to root_path
    if @comment.save
      redirect_to root_path
    else
      p "too long HEREEEEE"
      # flash[:error] = "Comment too long!"
      redirect_to root_path, :flash => { :error => "Comment too long!" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

end
