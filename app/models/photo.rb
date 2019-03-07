class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x400#", thumb: "90x90>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
