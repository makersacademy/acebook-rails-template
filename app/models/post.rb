
class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments
  validates :message, presence: true
  belongs_to :user
end
