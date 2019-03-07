class Post < ApplicationRecord
  belongs_to :user
  belongs_to :wall

  def can_edit(post_id, current_user_id)
    @post = Post.find(post_id)
    posted_at = @post.created_at
    editable = (Time.now - posted_at) > 600 ? false : true
    editable ? @post.user_id == current_user_id ? true : false : false
  end
end
