class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
end
