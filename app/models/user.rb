# frozen_string_literal: true

require 'uri'

class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { in: 6..10,
                                 wrong_length: 'Please insert a password between 6 to 10 characters long' }

  has_secure_password
end
