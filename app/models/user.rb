class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy


  validate :validate_username

  validates :username, confirmation: true
  validates :username, presence: true

  validates :username, format: { with: /^[a-zA-Z0-9_.]*$/, :multiline => true }

  def validate_username
    errors.add(:username, :already_exists) if User.exists?(username: username)
  end

end
