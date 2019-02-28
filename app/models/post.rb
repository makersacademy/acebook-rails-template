class Post < ApplicationRecord
  belongs_to :users, optional: true
  has_attached_file :image, styles: { medium: "300x400#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
