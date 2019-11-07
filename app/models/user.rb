class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :birthday, presence: true
end
