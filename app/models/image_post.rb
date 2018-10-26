# frozen_string_literal: true

class ImagePost < ApplicationRecord
  mount_uploader :picture, PictureUploader
<<<<<<< HEAD
  belongs_to :user
=======
  validates_processing_of :picture
  validate :image_size_validation

  private
    def image_size_validation
      errors[:picture] << "should be less than 3MB" if picture.size > 3.megabytes
    end
>>>>>>> d4b98efaa6f82fe2dcf0c48fa2b8f867b8ceb52e
end
