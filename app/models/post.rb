class Post < ApplicationRecord
  has_many :comments
  validates :message, presence: { message: "Can't fucking write?" }

  has_one_attached :image, dependent: false
end
