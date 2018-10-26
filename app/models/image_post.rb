# frozen_string_literal: true

class ImagePost < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates_processing_of :image
  validate :image_size_validation

  private
    def image_size_validation
      errors[:picture] << "should be less than 1MB" if image.size > 1.megabytes
    end
end
