class User < ApplicationRecord
  has_secure_password

  validates :name, uniqueness: true
  has_many :likes
  has_one_attached :avatar
end
