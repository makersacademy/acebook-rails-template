module CommentsHelper
  NOTICES = {
    :ten_min_edit => 'You can only edit the comment for 10 minutes after posting',
    :edit_own_comments => 'You can only edit your own comments'
  }

  def render_10_min_error(format)
    format.html { redirect_to posts_path, notice: NOTICES[:ten_min_edit] }
    format.json { render :index, status: :created, location: @comment }
  end

  def render_only_edit_own_comment_error(format)
    format.html { redirect_to posts_path, notice: NOTICES[:edit_own_comments] }
    format.json { render :index, status: :created, location: @comment }
  end
end
