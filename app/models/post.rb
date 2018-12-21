class Post < ApplicationRecord

  validates :description, presence: true,
                          length: { minimum: 1 }
end
