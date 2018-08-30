# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_secure_password

  # Returns the hash digest of the given string.
  # Its required here so we can create password digests for testing
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
