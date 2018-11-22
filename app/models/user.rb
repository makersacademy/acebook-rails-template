require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
