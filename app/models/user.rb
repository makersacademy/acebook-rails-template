# frozen_string_literal: true

require 'uri'
# require 'securerandom'

class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 6..10,
                                 wrong_length: 'Please insert a password between 6 to 10 characters long' }

  has_secure_password

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.password = SecureRandom.urlsafe_base64(n=7)
    end
  end
end
