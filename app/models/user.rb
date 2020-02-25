class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_photo

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
                      confirmation: true,
                      length: { minimum: 6, maximum: 10 }
  validates :profile_photo, presence: true

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
