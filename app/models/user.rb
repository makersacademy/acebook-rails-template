class User < ApplicationRecord
  # This is a module, part of ActiveModel library
  # full details here: https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password

  has_many :posts

end
