class Post < ApplicationRecord

  has_many :posts
  belongs_to :user
  validates :user_id, presence: true

end
