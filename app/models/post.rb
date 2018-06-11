class Post < ApplicationRecord
  validates :message, presence: true, unless: ->(post) { post.image.present? }
  validates :image, presence: true, unless: ->(post) { post.message.present? }

  belongs_to :user

  has_attached_file :image,
  styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
