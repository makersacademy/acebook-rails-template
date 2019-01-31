# frozen_string_literal: true
require 'pry'
class User < ApplicationRecord
  
  has_secure_password
  
  validates :username, presence: true

  validates :email, presence: { message: ': Email cannot be blank' },
                    uniqueness: { message: ': Email is not unique' }

  validates :password, presence: true,
                       length: { minimum: 5 }
end
