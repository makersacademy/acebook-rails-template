class Post < ApplicationRecord
  validates :message, presence: true,
                      length: { minimum: 1 }
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, as: :likeable
end
