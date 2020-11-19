class User < ApplicationRecord
  has_secure_password
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
