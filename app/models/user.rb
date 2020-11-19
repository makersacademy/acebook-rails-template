class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.unique_email_and_username?(username, email)
    unique_email?(email) && unique_username?(username)
  end

  def self.unique_email?(email)
    User.find_by_email(email).nil?
  end

  def self.unique_username?(username)
    User.find_by_username(username).nil?
  end

  def self.valid_email?(email)
    ((email =~ VALID_EMAIL_REGEX) == 0) ? true : false
  end

end