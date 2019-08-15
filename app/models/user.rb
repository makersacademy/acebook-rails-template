class User < ApplicationRecord

  has_many :posts

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true,
    length: { minimum: 6, maximum: 10}
end
