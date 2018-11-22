class CommentLike < ApplicationRecord
  self.primary_keys = :user_id, :likeable_id, :likeable_type
  belongs_to :user
  belongs_to :comment
end
