class User < ApplicationRecord
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 10 }
  validates :password_confirmation, presence: true
  has_many :posts
  has_many :likes, dependent: :destroy

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
