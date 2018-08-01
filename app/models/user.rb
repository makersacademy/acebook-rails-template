class User < ApplicationRecord
  # This is a module, part of ActiveModel library
  # full details here: https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
  validates_length_of :password, :in => 6..10, :on => :create


end
