class User < ApplicationRecord
  has_secure_password
  validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true,
                    length: { minimum: 6, maximum: 10 }
end
