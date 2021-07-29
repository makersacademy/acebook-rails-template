class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :message, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
end
