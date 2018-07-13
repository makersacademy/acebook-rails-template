class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # this line makes most recent comments appear first
  default_scope -> { order('created_at DESC') }
  
  # refactor note - I think we can delete the validates
  # post_id and user_id because it already requires them
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
