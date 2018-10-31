class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :posts
  has_many :likes
  has_many :wall_posts
  accepts_nested_attributes_for :wall_posts

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def slug_candidates
    [
      :name,
      [:name, rand(10).to_s],
      [:name, rand(10..100).to_s]
    ]
  end

  validates :name, presence: true,
                   format: { with: /\A[^0-9]*\z/, message: 'cannot contain numbers' }
end
