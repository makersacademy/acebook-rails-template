class User < ApplicationRecord
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_many :courses, dependent: :destroy
  has_secure_password
end
