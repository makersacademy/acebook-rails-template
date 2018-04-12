class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :message, presence: true, length: { minimum: 1 }
  belongs_to :user
end
