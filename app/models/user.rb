require 'bcrypt'

class User < ApplicationRecord
  has_many :posts
  has_secure_password

  include BCrypt

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
