class Album < ApplicationRecord
  has_many_attached :photos
  has_one :user
end
