class Person < ApplicationRecord
  has_many :posts
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
def not_following
  @following = self.followees
  @people = Person.all
  @not_following = @people - @following
end
end
