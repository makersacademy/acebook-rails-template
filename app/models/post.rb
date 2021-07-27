
class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :message, presence: true
  belongs_to :user
end
