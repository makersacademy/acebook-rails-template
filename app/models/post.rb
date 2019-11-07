class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_one_attached :image
  
end
