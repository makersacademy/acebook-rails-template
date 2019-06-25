require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates_presence_of :name, :email, :password
end
