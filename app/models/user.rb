class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def slug_candidates
    [
      :name,
      [:name, "#{rand(10)}"],
      [:name, "#{rand(100)}"]
    ]
  end

  validates :name, presence: true,
    format: { with: /\A[^0-9]*\z/, message: "cannot contain numbers" }
end
