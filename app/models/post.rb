class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :users, through: :likes
  validates :content, presence: true
end
