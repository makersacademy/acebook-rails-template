class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
