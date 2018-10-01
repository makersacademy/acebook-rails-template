class User < ApplicationRecord
  has_many :posts
  has_many :comments

  has_many :friendships
  has_many :friends, :through => :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
