class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates_presence_of :username, :password
  has_secure_password
end
