class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.email_and_username_in_use?(username, email)
    (self.email_in_use?(email) && self.username_in_use?(username))
  end

  def self.email_in_use?(email)
    !User.find_by_email(email).nil?
  end

  def self.username_in_use?(username)
    !User.find_by_username(username).nil?
  end

  def self.valid_email?(email)
    ((email =~ VALID_EMAIL_REGEX) == 0) ? true : false
  end

  def self.valid_password?(password)
    ((6 <= password.length) && (password.length <= 10))
  end
end