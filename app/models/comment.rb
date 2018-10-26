# frozen_string_literal: true

# Model for the Comment object
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :comment_text, presence: true
end
