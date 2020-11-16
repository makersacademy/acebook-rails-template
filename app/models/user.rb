class User < ApplicationRecord
  has_many :posts
  include Clearance::User
  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6, maximum: 10 }
end
