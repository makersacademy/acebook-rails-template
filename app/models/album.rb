class Album < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 1 }
  belongs_to :user

  has_many_attached :photos
end
