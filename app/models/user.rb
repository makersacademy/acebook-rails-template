class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_secure_password
end
