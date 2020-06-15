# frozen_string_literal: true

# Model for the Comment object
class ImageComment < ApplicationRecord
  belongs_to :image_post
  belongs_to :user
  validates :comment, presence: true
end
