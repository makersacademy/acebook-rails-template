class Post < ApplicationRecord
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy
end
