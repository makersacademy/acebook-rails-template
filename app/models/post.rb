class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
end
