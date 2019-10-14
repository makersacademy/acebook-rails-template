class User < ApplicationRecord
  has_secure_password
  validates :email, :email_format => { :message => 'Invalid Email' }
  validates :password, length: 6..10
end
