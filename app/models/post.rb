class Post < ApplicationRecord
  belongs_to :user
  belongs_to :wall
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :users, through: :likes
end
