class User < ApplicationRecord
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_many :posts, dependent: :destroy
  has_secure_password
end
