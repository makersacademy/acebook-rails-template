class User < ApplicationRecord
  # acts_as_token_authenticatable
  attr_accessor :first_name, :surname
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, length: {maximum:10}
  has_many :posts
end
