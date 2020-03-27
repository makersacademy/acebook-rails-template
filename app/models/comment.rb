class Comment < ApplicationRecord
  validates :comment, presence: true
end
