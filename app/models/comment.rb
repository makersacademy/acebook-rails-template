class Comment < ApplicationRecord
  acts_as_votable
  validates :comment, presence: true
end
