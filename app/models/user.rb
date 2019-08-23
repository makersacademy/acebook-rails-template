class User < ApplicationRecord
  has_one_attached :image
  has_secure_password validations: false
  validates :password, length: {minimum: 6, maximum: 10 }, on: :create
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
