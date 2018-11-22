class CommentLike < ApplicationRecord
  self.primary_keys = :user_id, :comment_id
  belongs_to :user
  belongs_to :comment
end
