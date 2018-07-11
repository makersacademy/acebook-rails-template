class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}
  belongs_to :user
  has_many :likes
  has_many :comments
end
