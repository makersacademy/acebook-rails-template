class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :password, :email, presence: true
  has_many :posts
end
