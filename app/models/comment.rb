class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  delegate :user_id, to: :user
  delegate :post_id, to: :post
end
