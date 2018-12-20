class Post < ApplicationRecord
  has_many :comments
  validates :description, presence: true,
                          length: { minimum: 1 }
end
