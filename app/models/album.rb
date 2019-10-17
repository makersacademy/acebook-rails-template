class Album < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  acts_as_votable

  validates :title, presence: true
  validates :body, presence: true
  validate :image_type

  def thumbnail(index)
    return self.images[index].variant(resize: '300x300')
  end

  private

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image.png'))
        errors.add(:images, "needs to be a JPEG or PNG")
      end
    end
  end
end
