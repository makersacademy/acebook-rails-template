class Post < ApplicationRecord

  validates :message, presence: true, length: { minimum: 5 }
end
