class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :friendships
  has_many :friends, through: :friendships

  def friend_with?(other)
    friendships.find_by(friend_id: other)
  end
end
