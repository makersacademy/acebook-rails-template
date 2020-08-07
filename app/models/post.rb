class Post < ApplicationRecord
  validates :message, presence: true,
                    length: { minimum: 1 }
  belongs_to :user

  has_attached_file :image, styles: { :medium => "506x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
