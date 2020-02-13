class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_with EmailValidator
  validates :password, length: { within: 6..10 }
end
