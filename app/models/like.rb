class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
#this ensures that someone can only like a post once
  validates :user_id, uniqueness: {scope: :post_id}
end
