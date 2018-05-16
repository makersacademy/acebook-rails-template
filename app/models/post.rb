class Post < ApplicationRecord

  validates :user_id, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
