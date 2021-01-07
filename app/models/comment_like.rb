class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :commontator_comments
end
