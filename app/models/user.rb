# frozen_string_literal: true

require 'uri'

class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :messages
  has_many :likes, through: :posts
  has_many :commentlikes, through: :comments
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, length: { in: 6..10,
                                 wrong_length: 'Please insert a password between 6 to 10 characters long' }

  has_secure_password

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.email = auth['info']['email']
      user.username = auth['info']['nickname']
      user.password = SecureRandom.urlsafe_base64(7)
    end
  end
end
