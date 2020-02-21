# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

  def self.search(search)
    search ? @users = User.where('email LIKE ?',"%#{search}%") : @users = User.all
  end
  
end
