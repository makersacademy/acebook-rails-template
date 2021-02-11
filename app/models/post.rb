class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :message, presence: true

end
