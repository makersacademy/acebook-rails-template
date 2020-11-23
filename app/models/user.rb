class User < ApplicationRecord
  has_secure_password
  has_many :comments, :dependent => :delete_all
  has_many :posts, :dependent => :delete_all
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
