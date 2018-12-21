class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :description, presence: true,
                          length: { minimum: 1 }
end
