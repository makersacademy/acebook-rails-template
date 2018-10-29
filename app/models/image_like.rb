# frozen_string_literal: true

# This model manages relationships with both the Image Post and its likes
class ImageLike < ApplicationRecord
  belongs_to :image_post
  belongs_to :user
end
