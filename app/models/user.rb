class User < ApplicationRecord
  has_many :posts
  validates :name, presence: { message: 'Please fill all fields.' }
  validates :email, presence: { message: 'Please fill all fields.' }
  validates :password, presence: { message: 'Please fill all fields.' }
end
