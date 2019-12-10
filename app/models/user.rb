class User < ApplicationRecord
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  # Include default devise modules. Othe rs available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
