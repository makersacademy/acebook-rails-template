class Post < ApplicationRecord

  has_many :posts, through: :users
  belongs_to :user
  validates :user_id, presence: true

end
