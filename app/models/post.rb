class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_many :users, through: :likes
end
