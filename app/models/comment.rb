class Comment < ApplicationRecord
  validates :text, presence: true
end
