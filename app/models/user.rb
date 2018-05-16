class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :posts, through: :likes
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def like!(post)
    self.likes.create!(post_id: post.id)
  end

  def unlike!(post)
    like = self.likes.find_by_post_id(post.id)
    like.destroy!
  end

  def like?(post)
    self.likes.find_by_post_id(post.id)
  end
end
