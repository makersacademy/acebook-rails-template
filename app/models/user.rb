class User < ApplicationRecord
  has_secure_password
  attr_accessor :email, :first_name, :last_name, :birthday, :gender, :password
  
  validates_presence_of :email, :first_name, :last_name, :birthday, :gender, :password
  validates_uniqueness_of :email
end
