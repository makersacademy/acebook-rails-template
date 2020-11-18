class User < ApplicationRecord
  has_secure_password
  validates :email, email: true
end
