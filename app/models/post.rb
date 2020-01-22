class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :recipient, class_name: "User", optional: true
end
