class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true, uniqueness: true,
    format: { with: /\A[a-zA-Z]*\z/, message: "Name cannot contain numbers or special characters" }
end
