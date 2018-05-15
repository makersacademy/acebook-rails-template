class User < ApplicationRecord
  has_secure_password
  validates :name, presence:true,
  length: {minimum: 6}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
