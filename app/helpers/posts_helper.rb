# frozen_string_literal: true

# Sessions helper
module PostsHelper
  def authorised?
    @post.user_id == current_user.id
  end

  def prevent_edit_with(message)
    flash[:danger] = message
  end

  def editable?
    Time.now < (@post.updated_at + 10.minutes)
  end
end
