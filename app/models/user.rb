class User < ApplicationRecord
  # has_many :posts

  validates_presence_of :fname, :lname, :email, :password
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 5
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
