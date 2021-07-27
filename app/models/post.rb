class Post < ApplicationRecord
  has_many :comments
  validates :message, presence: { message: "Can't fucking write?" }
end
