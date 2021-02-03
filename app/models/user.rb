class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates_presence_of :username, :password_digest
  has_secure_password
end
