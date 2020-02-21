# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

  def self.search(search)
    @users = search ? User.where('email LIKE ?', "%#{search}%") : User.all
  end
end
