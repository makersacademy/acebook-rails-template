require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :posts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :user,
    presence: true,
    length: { minimum: 3, maximum: 25 }
  validates :email,
    presence: true,
    length: { minimum: 10, maximum: 255 },
    format: { with: VALID_EMAIL_REGEX, message: "email address invalid, please try again" },
    uniqueness: { case_sensitive: false } #to avoid email duplication
  validates :password,
    presence: true,
    length: { minimum: 6, maximum: 255 }
end
