# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, :username, :email, :password, presence: true
  validates :password, length: { in: 8..20 }
  validates :email, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
end
