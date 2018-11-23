class Comment < ApplicationRecord
  validates :body, presence: true,
                   length: { minimum: 1 }

  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
end
