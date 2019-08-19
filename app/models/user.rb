class User < ApplicationRecord
  has_secure_password validations: false
  validates :password, length: {minimum: 6, maximum: 10 }, on: :create
  has_many :posts, dependent: :destroy
end
