class User < ApplicationRecord
  validates_presence_of :username, :password
  has_secure_password
end
