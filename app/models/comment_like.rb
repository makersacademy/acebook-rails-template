class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  def self.exists?(comment_id, user_id)
    CommentLike.find_by(comment_id: comment_id, user_id: user_id)
  end
end
