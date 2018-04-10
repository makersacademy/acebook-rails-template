class Post < ApplicationRecord
  has_many :likes, :comments
  validates :message, presence: true
end
