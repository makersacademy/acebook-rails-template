class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_likes
  has_many :users, through: :comment_likes
end
