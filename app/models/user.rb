require 'bcrypt'

class User < ApplicationRecord
  has_many :posts
  has_secure_password

  include BCrypt
  mount_uploader :avatarImage, ImageUploader
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
