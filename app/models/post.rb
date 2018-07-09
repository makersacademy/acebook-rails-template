class Post < ApplicationRecord
  belongs_to(:user)
  acts_as_votable
  has_many(:comments)
  validates :message, presence: true, length: { minimum: 1 }
end
