class ImagePost < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
