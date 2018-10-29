# frozen_string_literal: true

class ImagePost < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates_processing_of :picture
  validate :image_size_validation
  has_many :image_comments
  private

  def image_size_validation
    errors[:picture] << 'should be less than 3MB' if picture.size > 3.megabytes
  end
end
