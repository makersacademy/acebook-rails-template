class Post < ApplicationRecord
  validates :message, presence: { message: "Can't fucking write?" }
end
