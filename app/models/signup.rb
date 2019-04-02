require 'bcrypt'
class Signup < ActiveRecord::Base
  include BCrypt
  has_secure_password
end
