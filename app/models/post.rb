class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  validates :photo, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
end
