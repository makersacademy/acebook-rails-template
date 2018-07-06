class Post < ApplicationRecord
  belongs_to(:user)
  acts_as_votable
  validates :message, presence: true, length: { minimum: 1 }
end
