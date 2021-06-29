class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  acts_as_votable
  has_many :comments, dependent: :destroy
end
