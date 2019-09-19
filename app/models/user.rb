class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :friendships
  has_many :friends, :through => :friendships
  
  scope :friend_with, ->( other ) do
    other = other.id if other.is_a?( User )
    where( '(friendships.user_id = users.id AND friendships.friend_id = ?) OR (friendships.user_id = ? AND friendships.friend_id = users.id)', other, other ).includes( :friendships )
  end

  def friend_with?( other )
    friendships.find_by(friend_id: other)
  end

end
