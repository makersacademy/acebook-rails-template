class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes

  validates :comment, presence: true
end
