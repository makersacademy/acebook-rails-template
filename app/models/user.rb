class User < ApplicationRecord

  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_secure_password

  has_many :courses, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  
  has_one_attached :avatar

end
