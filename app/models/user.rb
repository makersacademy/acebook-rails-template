# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: {
    message: lambda do |_object, data|
      "#{data[:value]} already exists. Please enter a new email address"
    end
  }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Must be a valid email address' }

  validates :password, presence: true, length: { within: 6..10 }
end
