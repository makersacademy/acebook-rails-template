class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :posts
end
