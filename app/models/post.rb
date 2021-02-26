class Post < ApplicationRecord
  validates :message, presence: true
end
