class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  
  has_secure_password

  include BCrypt
  mount_uploader :avatarImage, ImageUploader
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
