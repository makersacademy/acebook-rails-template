class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    @comment.user_id = current_user.id
    @comment.save
    flash[:notice] = "Your comment was posted successfully"
    redirect_to posts_url
  end

  def index
    @user = User.find(@comment.user_id)
    @comment_owner = User.find(@comment.user_id)

    @email = @comment_owner.email
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if Time.now - @comment.created_at > 600
      flash[:error] = "Cannot update comment, time limit passed!"
    elsif @comment.user_id == current_user.id #checks if user owns post
      @comment.update(comment_params)
      #updates and changes the post
    end

        if Time.now - @comment.created_at > 600
          flash[:error] = "You can't edit your comment after 10 mins foooool, gotta delete it mate"
        else
          flash[:notice] = "Edit successful"
          #redirects and produces flash error
        end
        redirect_to posts_url
      end

  def destroy
    @comment =  Comment.find(params[:id])
    if @comment.user_id != current_user.id
      flash[:error] = "Calm down, you can only delete your own comments"
      redirect_to posts_url
    else
      @comment.destroy
      flash[:error] = "Delete successful"
      redirect_to posts_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end


end
