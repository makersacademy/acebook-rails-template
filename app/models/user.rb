class User < ApplicationRecord
  has_one_attached :avatar
  acts_as_voter
  has_many :posts
  has_many :comments
  validates :username, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  # validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
  has_secure_password :recovery_password, validations: false
end
