class User < ApplicationRecord
  has_secure_password
  has_many :likes
  has_many :posts
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
