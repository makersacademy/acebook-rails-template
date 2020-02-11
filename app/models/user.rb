# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..10,
                                                 wrong_length: 'Please insert a password between 6 to 10 characters long' }

  has_secure_password
end
