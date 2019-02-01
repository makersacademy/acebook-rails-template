class Post < ApplicationRecord
  validates :message, presence: { message: "Post must contain a message"}, allow_blank: false

end
