class User < ApplicationRecord
  has_secure_password
  p validates :email, :email_format => { :message => 'is not looking good' }
end
