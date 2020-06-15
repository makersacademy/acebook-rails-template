# frozen_string_literal: true

# Sessions helper
module PostsHelper
  def not_authorised?
    @post.user_id != current_user.id
  end

  def not_editable?
    Time.now > (@post.updated_at + 10.minutes)
  end

  def prevent_edit(message)
    flash[:danger] = message
    redirect_to posts_url
  end
end
