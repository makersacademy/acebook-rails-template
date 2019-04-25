class User < ApplicationRecord
  validates :email, presence: true

  # has_secure_password
end
