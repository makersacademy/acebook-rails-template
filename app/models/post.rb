class Post < ApplicationRecord
  validates :message, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
end
