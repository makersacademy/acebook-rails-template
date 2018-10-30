class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :wall_posts
  accepts_nested_attributes_for :wall_posts

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
end
