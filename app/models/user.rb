class User < ApplicationRecord
  has_secure_password
  has_many :comments
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
