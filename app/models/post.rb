class Post < ApplicationRecord

  has_one_attached :image

  validates :image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

end
