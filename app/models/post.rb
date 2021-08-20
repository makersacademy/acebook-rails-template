class Post < ApplicationRecord

  has_one_attached :image
  has_many :likes, dependent: :destroy
  
end
